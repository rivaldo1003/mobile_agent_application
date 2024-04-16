import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:elderselettricomobile/domain/mapper/mcu_mapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:slidable_button/slidable_button.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../core/ble/ble_device_interactor.dart';
import '../../../core/utils/mcu_util.dart';
import '../../../core/values/colors.dart';
import '../../../core/values/icons.dart';
import '../../../domain/model/battery.dart';
import '../../../core/utils/configurations.dart';
import '../../../domain/model/mcu.dart';
import '../../../domain/model/vehicle.dart';
import '../../common/alert_bottom_sheet.dart';
import '../../common/alert_snackbar.dart';
import '../../common/custom_network_image.dart';
import '../../common/item_specifications.dart';
import '../../common/text_style.dart';
import '../battery_information_page.dart';
import '../../configuration/settings_item_pages.dart';
import '../viewmodels/battery_viewmodel.dart';
import 'empty_telemetry_data.dart';
import 'failed_get_data.dart';
import 'view_all_bottom_sheet.dart';

class CharacteristicTile extends StatefulWidget {
  final DeviceConnectionState? connectionState;
  final Vehicle vehicle;
  final QualifiedCharacteristic characteristic;
  final QualifiedCharacteristic writeCharacteristic;

  final void Function(McuData800?)? onConnectionStateReceived;
  final void Function(McuObject)? onDataReceived;

  const CharacteristicTile({
    required this.characteristic,
    required this.writeCharacteristic,
    required this.vehicle,
    this.onConnectionStateReceived,
    this.onDataReceived,
    this.connectionState,
  });

  @override
  State<CharacteristicTile> createState() => _CharacteristicTileState();
}

class _CharacteristicTileState extends State<CharacteristicTile>
    with TickerProviderStateMixin {
  final _ble = FlutterReactiveBle();
  Timer? _errorSliderTimer;
  McuObject? _mcuObject = null;
  StreamSubscription<List<int>>? _subscribeStream;
  StreamSubscription<ConnectionStateUpdate>? _connectionStream;
  DeviceConnectionState? _connectionState;

  Animation<Color?>? animation;
  AnimationController? controller;
  late final AnimationController _sliderController;

  bool _isMotorOn = false;
  bool _lockSlider = true;
  bool _lockSliderAfterChange = false;
  bool _isDisableSlider = false;
  bool _isLoadingSlider = false;
  bool _showFailedGetData = false;
  var _telemetryState = TelemetryState.loading;

  double _visibilityFraction = 1.0;
  int _subscribeDataCount = 0;

  @override
  void dispose() {
    controller?.dispose();
    _subscribeStream?.cancel();
    _connectionStream?.cancel();
    _errorSliderTimer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _sliderController = AnimationController.unbounded(vsync: this);
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    final CurvedAnimation curve =
        CurvedAnimation(parent: controller!, curve: Curves.linear);
    animation = ColorTween(
      begin: Colors.white,
      end: Colors.black,
    ).animate(curve);

    controller!.forward();

    _getDataBatteryInfo();
    loadConfigData(widget.vehicle.deviceId);
    _connectionState = widget.connectionState;
    if (widget.connectionState != DeviceConnectionState.disconnected) {
      _subscribeToCharacteristic();
      _checkDeviceConnection();
    } else {
      _telemetryState = TelemetryState.disconnected;
      _setDisableSlider(true);
    }
    _startConnectedDeviceStream();
  }

  Future<void> _checkDeviceConnection() async {
    final jsonString = convertDataToJson(
      packageId: 800,
      dataUploadItem: [1],
    );
    final interactor = context.read<BleDeviceInteractor>();
    await interactor.writeCharacteristicWithResponse(
        widget.writeCharacteristic, utf8.encode(jsonString));

    print(jsonString);
  }

  void _startConnectedDeviceStream() {
    _connectionStream = _ble.connectedDeviceStream.listen((event) {
      if (event.deviceId != widget.vehicle.deviceId) return;
      _connectionState = event.connectionState;

      if (event.connectionState == DeviceConnectionState.connected) {
        _subscribeDataCount = 0;
        _lockSlider = true;
        if (_isDisableSlider) {
          _setDisableSlider(false);
        }

        _retrySubscribeCharacteristic();
      } else if (event.connectionState == DeviceConnectionState.disconnected) {
        if (!_isDisableSlider) {
          _setDisableSlider(true);
        }
        if (_isMotorOn) {
          _setSliderValue(false);
          setState(() {});
        }
        _subscribeStream?.cancel();
      }
    });
  }

  void _retrySubscribeCharacteristic() {
    if (_subscribeStream != null) {
      _subscribeStream?.cancel().whenComplete(() {
        _subscribeToCharacteristic();
      });
    } else {
      _subscribeToCharacteristic();
    }
  }

  void _setDisableSlider(bool value) {
    if (!mounted) return;
    setState(() {
      _isDisableSlider = value;
    });
  }

  Future<void> _subscribeToCharacteristic() async {
    await Future.delayed(const Duration(milliseconds: 300));
    final interactor = context.read<BleDeviceInteractor>();
    _subscribeStream = interactor
        .subscribeToCharacteristic(widget.characteristic)
        .listen((event) {
      _onCharacteristicValueChanged(event);
    }, onError: (e) {
      if (!mounted) return;
      _subscribeDataCount++;
      _subscribeStream?.cancel().whenComplete(() {
        _subscribeStream = null;
        if (_subscribeDataCount < 3) {
          _subscribeToCharacteristic();
        } else {
          if (_showFailedGetData) return;
          if (_visibilityFraction == 0.0) return;
          _showFailedGetDataBottomSheet();
        }
      });
    });
  }

  void _showFailedGetDataBottomSheet() {
    _showFailedGetData = true;
    showRoundedBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (_) {
          return FailedGetData(
            onTap: () {
              _subscribeDataCount = 0;
              Navigator.of(context).pop();
              _retrySubscribeCharacteristic();
            },
          );
        }).whenComplete(() {
      _showFailedGetData = false;
    });
  }

  void _onCharacteristicValueChanged(List<int> event) {
    try {
      final mcuObject = parseCharacteristicValue(event);
      if (mcuObject.packageId == 800) {
        widget.onConnectionStateReceived?.call(mcuObject.data?.to800());
        return;
      }

      if (mcuObject.packageId == 803) {
        _setSliderState(mcuObject.data?.to803());
        return;
      }

      if (mcuObject.data is McuTelemetryData && mounted) {
        //print("$decodedData");
        _mcuObject = mcuObject;
        _setBatteryData(mcuObject.data?.toTelemetry());
        widget.onDataReceived?.call(mcuObject);
        setState(() {});
      }
    } catch (e) {
      _telemetryState = TelemetryState.error;
      setState(() {});
      _subscribeStream?.cancel().whenComplete(
        () {
          showErrorModalBottomSheet(
            context,
            title: 'Failed to parse data',
            message: 'MCU is currently not supported by this app',
            imagePath: 'assets/images/change_config_illustration.svg',
          );
        },
      );
      _subscribeStream = null;
    }
  }

  void _setSliderState(McuData803? data) {
    if (_lockSlider) _lockSlider = false;
    if (data == null) return;
    final enable = data.vehicleOn || data.controllerStatus;
    if (enable) {
      if (_isMotorOn) return;
      _setSliderValue(true);
    } else {
      if (!_isMotorOn) return;
      _setSliderValue(false);
    }
    if (_isLoadingSlider) _isLoadingSlider = false;
    _lockSliderAfterChange = true;
    setState(() {});
    Future.delayed(Duration(seconds: 2), () {
      if (!mounted) return;
      setState(() {
        _lockSliderAfterChange = false;
      });
    });
  }

  void _setSliderValue(bool value) {
    _isMotorOn = value;
    _sliderController.value = value ? 1.0 : 0.0;
  }

  Future _getDataBatteryInfo() async {
    final viewModel = context.read<BatteryViewModel>();
    viewModel.getDataBatteryInfo(widget.vehicle.deviceId);
  }

  void _setBatteryData(McuTelemetryData? data) {
    if (data == null) return;
    if (data.dataLength == 0) return;
    context
        .read<BatteryViewModel>()
        .setBatteryData(data.values[McuValue.battVoltage]);
  }

  @override
  Widget build(BuildContext context) {
    final model = context.read<BatteryViewModel>();

    return VisibilityDetector(
      key: Key('device-characteristic-key'),
      onVisibilityChanged: (visibilityInfo) {
        _visibilityFraction = visibilityInfo.visibleFraction;
      },
      child: Column(
        children: [
          Container(
            color: surfaceColor,
            padding: EdgeInsets.only(
              left: 16,
              top: 8,
              right: 16,
              bottom: 0,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: _navigateToBatteryInformatiom,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppIcons.svg(
                            'battery_horizontal',
                            height: 24,
                            width: 24,
                            color: model.dataDuro == null || !_isMotorOn
                                ? darkGrey400
                                : null,
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              _batteryText(model.getBatteryPercentage(), '%'),
                              SizedBox(width: 2),
                              AppIcons.svg('chevron_down'),
                            ],
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Charge left',
                            style: AppTextStyle.subtitle7,
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Container(
                        padding: EdgeInsets.only(top: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: widget.vehicle.photoPath.isEmpty &&
                                widget.vehicle.photoUrl == null
                            ? Image.asset(
                                'assets/images/vespa3.png',
                                width: 160,
                                height: 160,
                              )
                            : widget.vehicle.photoUrl != null
                                ? Container(
                                    margin: const EdgeInsets.only(bottom: 16),
                                    child: CustomNetworkImage(
                                      imageUrl: widget.vehicle.photoUrl!,
                                      width: 160,
                                      height: 160,
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.only(bottom: 16),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.file(
                                        File(widget.vehicle.photoPath),
                                        fit: BoxFit.cover,
                                        width: 160,
                                        height: 160,
                                      ),
                                    ),
                                  ),
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppIcons.svg(
                            'map_range',
                            height: 24,
                            width: 24,
                            color: model.estRangeDuro == null || !_isMotorOn
                                ? darkGrey400
                                : null,
                          ),
                          SizedBox(height: 8),
                          _batteryText(model.getEstRange(), 'km'),
                          SizedBox(height: 2),
                          Text(
                            'Est. Range',
                            style: AppTextStyle.subtitle7,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                _buildOnOffSystemSlider(),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    //configMode(),
                    GestureDetector(
                      onTap: _navigateToSetting,
                      child: Container(
                        height: 40,
                        width: 40,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        margin: EdgeInsets.only(left: 16),
                        child: AppIcons.svg('bold/settings'),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
          _buildTelemetryData(),
        ],
      ),
    );
  }

  Future<void> _navigateToBatteryInformatiom() async {
    final model = context.read<BatteryViewModel>();
    BatteryType? result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return BatteryInformation(
            dataSpeedster: model.dataSpeedster,
            dataDuro: model.dataDuro,
            estRangeSpeedster: model.estRangeSpeedster,
            estRangeDuro: model.estRangeDuro,
          );
        },
      ),
    );
    if (result != null) {
      context
          .read<BatteryViewModel>()
          .saveDataBatteryInfo(result.text, widget.vehicle.deviceId);
      setState(() {});
    }
  }

  void _navigateToSetting() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return Setting(
        mcuVersion: _mcuObject?.version,
        readCharacteristic: widget.characteristic,
        writeCharacteristic: widget.writeCharacteristic,
      );
    }));
  }

  Widget _batteryText(String text, String format) {
    return RichText(
      text: TextSpan(text: text, style: AppTextStyle.title2, children: [
        TextSpan(
          text: ' $format',
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
      ]),
    );
  }

  Widget _buildConfigMode() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/icons/chevron_left.svg'),
          SizedBox(width: 16),
          Column(
            children: [
              Text(
                'Config mode',
                style: GoogleFonts.montserrat(
                  color: darkGrey300,
                ),
              ),
              SizedBox(height: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 6),
                  Text(
                    'Comfort',
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(width: 16),
          SvgPicture.asset('assets/icons/chevron_right.svg'),
        ],
      ),
    );
  }

  Widget _buildTelemetryData() {
    final dataValue = _mcuObject?.data?.toTelemetry();

    return Container(
      padding: EdgeInsets.all(16),
      color: surfaceColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Telemetry Data',
                style: AppTextStyle.title2,
              ),
              GestureDetector(
                onTap: () {
                  if (dataValue != null) {
                    showRoundedMaterialBottomSheet(
                      context: context,
                      builder: (_) {
                        return AllView(
                          characteristic: widget.characteristic,
                          connectionState: _connectionState,
                          isMotorOn: _isMotorOn,
                          mcuObject: _mcuObject,
                        );
                      },
                    );
                  }
                },
                child: Text(
                  'View all',
                  style: GoogleFonts.montserrat(
                    color: dataValue != null
                        ? Theme.of(context).primaryColor
                        : darkGrey400,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          dataValue != null || _telemetryState == TelemetryState.error
              ? _buildTelemetryGrid(dataValue)
              : _telemetryState == TelemetryState.loading
                  ? _loadingIndicator()
                  : EmptyTelemetryData(
                      title: 'Device Disconnected',
                      message:
                          'Please connect to MCU to get vehicle information',
                    ),
        ],
      ),
    );
  }

  Widget _buildTelemetryGrid(McuTelemetryData? dataValue) => Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ItemSpecifications(
                image: _isMotorOn && dataValue != null
                    ? 'assets/icons/speed.png'
                    : 'assets/icons/speed_grey.svg',
                titleItem: 'Speed',
                valueItem: dataValue?.values[McuValue.speed]?.toInt() ?? '--',
                format: 'km/h',
              ),
              SizedBox(width: 20),
              ItemSpecifications(
                image: _isMotorOn && dataValue != null
                    ? 'assets/icons/battery_voltage.png'
                    : 'assets/icons/battery_voltage_grey.svg',
                titleItem: 'Batt. Voltage',
                valueItem: dataValue?.values[McuValue.battVoltage] ?? '--',
                format: 'V',
              ),
              SizedBox(width: 20),
              ItemSpecifications(
                image: _isMotorOn && dataValue != null
                    ? 'assets/icons/battery_voltage.png'
                    : 'assets/icons/battery_voltage_grey.svg',
                titleItem: 'Batt. Current',
                valueItem: dataValue?.values[McuValue.battCurrent] ?? '--',
                format: 'A',
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ItemSpecifications(
                image: _isMotorOn && dataValue != null
                    ? 'assets/icons/trip_distance.png'
                    : 'assets/icons/trip_distance_grey.svg',
                titleItem: 'Trip Distance',
                valueItem: dataValue?.values[McuValue.tripDistance] ?? '--',
                format: 'km',
              ),
              SizedBox(width: 20),
              ItemSpecifications(
                image: _isMotorOn && dataValue != null
                    ? 'assets/icons/temp.png'
                    : 'assets/icons/temperature_grey.svg',
                titleItem: 'Temperature',
                valueItem: dataValue?.values[McuValue.temp] ?? '--',
                format: '°C',
              ),
              SizedBox(width: 20),
              ItemSpecifications(
                image: _isMotorOn && dataValue != null
                    ? 'assets/icons/mode.png'
                    : 'assets/icons/mode_grey.svg',
                titleItem: 'Mode',
                valueItem: dataValue?.values[McuValue.mode],
                format: '',
              ),
            ],
          ),
        ],
      );

  Widget _loadingIndicator() => Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Center(
          child: SizedBox(
            width: 30,
            height: 30,
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          ),
        ),
      );

  Widget _buildOnOffSystemSlider() {
    return HorizontalSlidableButton(
      controller: _sliderController,
      initialPosition: _isMotorOn
          ? SlidableButtonPosition.end
          : SlidableButtonPosition.start,
      height: 58,
      disabledColor: Colors.transparent,
      width: 255,
      isRestart: false,
      buttonWidth: 54.0,
      dismissible: false,
      completeSlideAt: _isMotorOn ? 0.1 : 0.9,
      label: Container(
        width: 50,
        height: 50,
        margin:
            _isMotorOn ? EdgeInsets.only(right: 4) : EdgeInsets.only(left: 4),
        decoration: BoxDecoration(
          color: _isDisableSlider ? disabledColor : Colors.white,
          shape: BoxShape.circle,
        ),
        child: _isLoadingSlider
            ? Padding(
                padding: const EdgeInsets.all(15.0),
                child: CircularProgressIndicator(
                  color: darkGrey900,
                ),
              )
            : Container(
                padding: EdgeInsets.all(13),
                child: AppIcons.svg(
                  'power',
                  color: _isMotorOn ? greenColor2 : darkGrey900,
                ),
              ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: _isMotorOn
              ? LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [
                    greenColor,
                    greenColor.withOpacity(0.6),
                    greenColor.withOpacity(0),
                  ],
                )
              : null,
          color: _isMotorOn ? greenColor : darkGrey800,
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.only(
          left: 8,
          right: 8,
        ),
        child: Row(
          children: [
            Expanded(
              child: _isMotorOn
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RotatedBox(
                          quarterTurns: 2,
                          child: Shimmer.fromColors(
                            child: SvgPicture.asset('assets/icons/slide.svg'),
                            baseColor: darkGrey200,
                            highlightColor: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 45, left: 4),
                          child: Text(
                            'Slide to turn off',
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 45),
                          child: Text(
                            !_isDisableSlider
                                ? 'Slide to turn on'
                                : 'Connect to turn on',
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: !_isDisableSlider
                                  ? Colors.white
                                  : darkGrey400,
                            ),
                          ),
                        ),
                        _isDisableSlider
                            ? Container()
                            : Container(
                                padding: EdgeInsets.only(top: 1.5, left: 3),
                                child: Shimmer.fromColors(
                                  child: SvgPicture.asset(
                                      'assets/icons/slide.svg'),
                                  baseColor: darkGrey200,
                                  highlightColor: Colors.white,
                                ),
                              ),
                      ],
                    ),
            ),
          ],
        ),
      ),
      onChanged: _isDisableSliderOnChanged()
          ? null
          : (positionNew) {
              final isOnDigipot = positionNew == SlidableButtonPosition.end;

              if (isOnDigipot != _isMotorOn) {
                _errorSliderTimer?.cancel();
                setState(() {
                  _isLoadingSlider = true;
                });
                _writeCharacteristic(isOnDigipot).onError((error, stackTrace) {
                  onErrorWriteCharacteristic(isOnDigipot);
                });
              }
            },
    );
  }

  bool _isDisableSliderOnChanged() =>
      _isLoadingSlider ||
      _isDisableSlider ||
      _lockSliderAfterChange ||
      _lockSlider;

  Future<void> _writeCharacteristic(bool isOnDigipot) async {
    final jsonString = convertDataToJson(
      packageId: 803,
      dataUploadItem: [
        isOnDigipot ? 1 : 0,
      ],
    );

    final interactor = context.read<BleDeviceInteractor>();
    for (int i = 0; i < 2; i++) {
      await interactor.writeCharacteristicWithResponse(
          widget.writeCharacteristic, utf8.encode(jsonString));
    }

    print(jsonString);
    saveConfigDataToLocal(widget.vehicle.deviceId);

    _errorSliderTimer = Timer(Duration(milliseconds: 3500), () {
      if (_isLoadingSlider) {
        onErrorWriteCharacteristic(isOnDigipot);
      }
    });
  }

  void onErrorWriteCharacteristic(bool isOnDigipot) {
    showErrorSnackBar(
        'Error', 'Failed to ${isOnDigipot ? "turn on" : "turn off"}');
    setState(() {
      _isLoadingSlider = false;
    });
    _sliderController.value = _isMotorOn ? 1.0 : 0.0;
  }
}
