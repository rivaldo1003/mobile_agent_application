import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:elderselettricomobile/presentation/configuration/tire_diameter.dart';
import 'package:elderselettricomobile/core/values/colors.dart';
import 'package:elderselettricomobile/presentation/configuration/widgets/setting_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/values/icons.dart';
import '../common/alert_bottom_sheet.dart';
import '../../core/utils/configurations.dart';
import '../../core/utils/mcu_util.dart';
import 'adj_accelerator.dart';
import 'auto_cruise.dart';
import 'battery_current_limit.dart';
import 'boost.dart';
import 'ebs_brake.dart';
import 'eco_mode.dart';
import 'fast_start.dart';
import 'forward_reverse.dart';
import 'hall_sensor.dart';
import 'low_voltage_threshold.dart';
import 'manual_cruise.dart';
import 'motor_lock_item.dart';
import 'overspeed.dart';
import 'phase_current_limit.dart';
import 'reverse_speed_limit.dart';
import 'soft_start.dart';
import 'speed_limit.dart';
import 'detail_screen_item_settings.dart';

class Setting extends StatefulWidget {
  static bool isReset = false;
  static List<String>? receivedFastStartNew;
  static List<String>? receivedSoftStartNew;
  static List<String>? receivedSpeedLimit2;
  static List<String>? receivedReverseSpeedLimitNew2;
  static double? receivedEbsBrakeNew2;
  static double? receivedForwardReverse2;
  static double? receivedBatteryCurrentLimit2;
  static double? receivedPhaseCurrentLimit2;
  static double? receivedLowVoltageThreshold2;
  static double? receivedManualCruise2;
  static double? receivedAutoCruise2;
  static double? receivedHallSensor2;
  static double? receivedBoost2;
  static List<String>? receivedDataOverSpeedNew;
  static double? receivedEcoMode;
  static double? receivedAdjustAccelerator;
  static double? receivedMotorLock;
  static double? receivedSound;
  static double? tireDiameter;

  static final int id_configuration = 194;
  static final int id_end_data = 204;
  static final int dataEmpty = 0;
  static final int crcData = 94;

  Setting({
    this.readCharacteristic,
    this.writeCharacteristic,
    this.mcuVersion,
  });

  final QualifiedCharacteristic? readCharacteristic;
  final QualifiedCharacteristic? writeCharacteristic;
  final int? mcuVersion;

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final _ble = FlutterReactiveBle();
  StreamSubscription<List<int>>? _subscribeStream;
  var _isUploading = false;

  void resetData() {
    setState(() {
      Setting.receivedFastStartNew = ['5', '1'];
      Setting.receivedSoftStartNew = ['5', '1'];
      Setting.receivedSpeedLimit2 = ['60', '0'];
      Setting.receivedDataOverSpeedNew = ['10', '80', '1'];
      Setting.receivedReverseSpeedLimitNew2 = ['30', '1'];
      Setting.receivedEbsBrakeNew2 = 5;
      Setting.receivedForwardReverse2 = 1;
      Setting.receivedBatteryCurrentLimit2 = 100;
      Setting.receivedPhaseCurrentLimit2 = 100;
      Setting.receivedLowVoltageThreshold2 = 40;
      Setting.receivedManualCruise2 = 1;
      Setting.receivedAutoCruise2 = 0;
      Setting.receivedHallSensor2 = 1;
      Setting.receivedBoost2 = 1;
      Setting.receivedEcoMode = 0;
      Setting.receivedAdjustAccelerator = 0;
      Setting.receivedMotorLock = 0;
      Setting.tireDiameter = 0.43;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingAppBar(
          title: 'Configuration',
          onBackPressed: () {
            Navigator.pop(context);
          },
          onReset: () {
            showConfirmationAlertDialog(
              context,
              title: "Reset Confirmation",
              message: "Are you sure you want to reset configurations?",
              onConfirm: () {
                resetData();
                Navigator.of(context).pop();
              },
            );
          }),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ItemSetting(
                title: 'Tire Diameter',
                menu: TireDiameter(
                    tireDiameter: Setting.tireDiameter ?? 0.0,
                    deviceId: widget.readCharacteristic?.deviceId),
                value:
                    '${Setting.tireDiameter == null ? 0.0 : Setting.tireDiameter} m',
              ),
              ItemSetting(
                title: 'Fast Start',
                menu: FastStart(
                  id: 1,
                  fastStart: Setting.receivedFastStartNew?[0] ?? '5',
                  isOn: Setting.receivedFastStartNew?[1] ?? '1',
                ),
                value: (Setting.receivedFastStartNew == null)
                    ? '0'
                    : (Setting.receivedFastStartNew![1].toString() == '0'
                        ? 'Fast Start: ${Setting.receivedFastStartNew![0]}, Status: OFF'
                        : 'Fast Start: ${Setting.receivedFastStartNew![0]}, Status: ON'),
              ),
              ItemSetting(
                title: 'Soft Start',
                menu: SoftStart(
                  id: 2,
                  softStart: Setting.receivedSoftStartNew?[0] ?? '5',
                  isOn: Setting.receivedSoftStartNew?[1] ?? '1',
                ),
                value: (Setting.receivedSoftStartNew == null)
                    ? '0'
                    : (Setting.receivedSoftStartNew![1].toString() == '0'
                        ? 'Soft Start: ${Setting.receivedSoftStartNew![0]}, Status: OFF'
                        : 'Soft Start: ${Setting.receivedSoftStartNew![0]}, Status: ON'),
              ),
              ItemSetting(
                title: 'Speed Limit',
                menu: SpeedLimit(
                  id: 2,
                  speedLimit: Setting.receivedSpeedLimit2?[0] ?? '60',
                  isOn: Setting.receivedSpeedLimit2?[1] ?? '0',
                ),
                value: (Setting.receivedSpeedLimit2 == null)
                    ? '0'
                    : (Setting.receivedSpeedLimit2![1].toString() == '0'
                        ? 'Speed Limit: ${Setting.receivedSpeedLimit2![0]}, Status: OFF'
                        : 'Speed Limit: ${Setting.receivedSpeedLimit2![0]}, Status: ON'),
              ),
              ItemSetting(
                title: 'Overspeed',
                menu: Overspeed(
                  id: 3,
                  overspeedSpeedRatio:
                      Setting.receivedDataOverSpeedNew?[0] ?? '10',
                  overspeedLowSpeedRatio:
                      Setting.receivedDataOverSpeedNew?[1] ?? '80',
                  isOn: Setting.receivedDataOverSpeedNew?[2] ?? '1',
                ),
                value: (Setting.receivedDataOverSpeedNew == null)
                    ? '0'
                    : 'Speed Ratio: ${Setting.receivedDataOverSpeedNew![0]}, ' +
                        'Low Speed Ratio: ${Setting.receivedDataOverSpeedNew![1]}, ' +
                        '${Setting.receivedDataOverSpeedNew![2].toString() == '0' ? 'OFF' : 'ON'}',
              ),
              ItemSetting(
                title: 'Reverse Speed Limit',
                menu: ReverseSpeedLimit(
                  id: 5,
                  reverseSpeedLimit:
                      Setting.receivedReverseSpeedLimitNew2?[0] ?? '30',
                  isOn: Setting.receivedReverseSpeedLimitNew2?[1] ?? '1',
                ),
                value: (Setting.receivedReverseSpeedLimitNew2 == null)
                    ? '0'
                    : (Setting.receivedReverseSpeedLimitNew2![1].toString() ==
                            '0'
                        ? 'Reverse Speed Limit: ${Setting.receivedReverseSpeedLimitNew2![0]}, Status: OFF'
                        : 'Reverse Speed Limit: ${Setting.receivedReverseSpeedLimitNew2![0]}, Status: ON'),
              ),
              ItemSetting(
                title: 'EBS Brake',
                menu: EbsBrake(
                  id: 6,
                  ebsBrake: Setting.receivedEbsBrakeNew2 ?? 5,
                ),
                value: (Setting.receivedEbsBrakeNew2 == null)
                    ? '0'
                    : '${Setting.receivedEbsBrakeNew2!.toInt()}',
              ),
              ItemSetting(
                title: 'Forward Reverse',
                menu: ForwardReverse(
                  id: 7,
                  forwardReverse: Setting.receivedForwardReverse2?.toInt() ?? 0,
                ),
                value: (Setting.receivedForwardReverse2 == null)
                    ? 'Reverse'
                    : (Setting.receivedForwardReverse2!.toInt() == 0)
                        ? 'Reverse'
                        : 'Forward',
              ),
              ItemSetting(
                title: 'Battery Current Limit',
                menu: BatteryCurrentLimit(
                  id: 8,
                  batteryCurrentLimit:
                      Setting.receivedBatteryCurrentLimit2 ?? 100,
                ),
                value: (Setting.receivedBatteryCurrentLimit2 == null)
                    ? '0'
                    : '${Setting.receivedBatteryCurrentLimit2!.toInt()}%',
              ),
              ItemSetting(
                title: 'Phase Current Limit',
                menu: PhaseCurrentLimit(
                  id: 9,
                  phaseCurrentLimit: Setting.receivedPhaseCurrentLimit2 ?? 100,
                ),
                value: (Setting.receivedPhaseCurrentLimit2 == null)
                    ? '0'
                    : '${Setting.receivedPhaseCurrentLimit2!.toInt()}%',
              ),
              ItemSetting(
                title: 'Low Voltage Threshold',
                menu: LowVoltageThreshold(
                  id: 10,
                  lowVoltageThreshold:
                      Setting.receivedLowVoltageThreshold2 ?? 40,
                ),
                value: (Setting.receivedLowVoltageThreshold2 == null)
                    ? '0'
                    : '${Setting.receivedLowVoltageThreshold2!.toInt()}V',
              ),
              ItemSetting(
                title: 'Manual Cruise',
                menu: ManualCruise(
                  id: 11,
                  manualCruiseValue:
                      Setting.receivedManualCruise2?.toInt() ?? 0,
                ),
                value: (Setting.receivedManualCruise2 == null)
                    ? 'OFF'
                    : (Setting.receivedManualCruise2!.toInt() == 0)
                        ? 'OFF'
                        : 'ON',
              ),
              ItemSetting(
                title: 'Auto Cruise',
                menu: AutoCruise(
                  id: 12,
                  autoCruiseValue: Setting.receivedAutoCruise2?.toInt() ?? 0,
                ),
                value: (Setting.receivedAutoCruise2 == null)
                    ? 'OFF'
                    : (Setting.receivedAutoCruise2!.toInt() == 0)
                        ? 'OFF'
                        : 'ON',
              ),
              ItemSetting(
                title: 'Hall Sensor',
                menu: HallSensor(
                  id: 13,
                  hallSensorValue: Setting.receivedHallSensor2?.toInt() ?? 0,
                ),
                value: (Setting.receivedHallSensor2 == null)
                    ? '60'
                    : (Setting.receivedHallSensor2!.toInt() == 0)
                        ? '60'
                        : '120',
              ),
              ItemSetting(
                title: 'ECO Mode',
                menu: EcoMode(
                  id: 14,
                  ecoMode: Setting.receivedEcoMode?.toInt() ?? 0,
                ),
                value: (Setting.receivedEcoMode == null)
                    ? 'OFF'
                    : (Setting.receivedEcoMode!.toInt() == 0)
                        ? 'OFF'
                        : 'ON',
              ),
              ItemSetting(
                title: 'Adjust Accelerator',
                menu: AdjustAccelerator(
                  id: 15,
                  adjustAcceleratorValue:
                      Setting.receivedAdjustAccelerator?.toInt() ?? 0,
                ),
                value: (Setting.receivedAdjustAccelerator == null)
                    ? 'OFF'
                    : (Setting.receivedAdjustAccelerator!.toInt() == 0)
                        ? 'OFF'
                        : 'ON',
              ),
              ItemSetting(
                title: 'Boost',
                menu: Boost(
                  id: 16,
                  boostValue: Setting.receivedBoost2?.toInt() ?? 0,
                ),
                value: (Setting.receivedBoost2 == null)
                    ? 'OFF'
                    : (Setting.receivedBoost2!.toInt() == 0)
                        ? 'OFF'
                        : 'ON',
              ),
              ItemSetting(
                title: 'Motor Lock',
                menu: MotorLock(
                  id: 17,
                  motorLockValue: Setting.receivedMotorLock?.toInt() ?? 0,
                ),
                value: (Setting.receivedMotorLock == null)
                    ? 'OFF'
                    : (Setting.receivedMotorLock!.toInt() == 0)
                        ? 'OFF'
                        : 'ON',
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: EdgeInsets.only(
              top: 16, bottom: Platform.isIOS ? 8 : 16, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Material(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      if (_isUploading) {
                        return;
                      }
                      _applyChange().onError((error, stackTrace) {
                        print('error: $error');
                        _onUploadConfigFailed();
                      });
                    },
                    borderRadius: BorderRadius.circular(24),
                    splashColor: Colors.grey,
                    child: Center(
                      child: _isUploading
                          ? SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                  color: Colors.white),
                            )
                          : Text(
                              'Apply',
                              style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                              ),
                            ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _applyChange() async {
    setState(() {
      _isUploading = true;
    });

    final dataUploadItem = getMcuDataUploadItems();

    final jsonString = convertDataToJson(
      packageId: 802,
      version: widget.mcuVersion,
      packageType: 3,
      dataId: 255,
      dataUploadItem: dataUploadItem,
    );

    if (widget.writeCharacteristic == null) return;
    _readCharacteristic();
    for (int i = 0; i < 3; i++) {
      await _ble.writeCharacteristicWithResponse(widget.writeCharacteristic!,
          value: utf8.encode(jsonString));
    }
    print(jsonString);
    saveConfigDataToLocal(widget.readCharacteristic?.deviceId ?? '');

    Future.delayed(Duration(seconds: 5), () {
      if (_isUploading) {
        _onUploadConfigFailed();
      }
    });
  }

  void _readCharacteristic() {
    if (widget.readCharacteristic == null) {
      return;
    }
    _subscribeStream = _ble
        .subscribeToCharacteristic(widget.readCharacteristic!)
        .listen((event) {
      final dataTemp = String.fromCharCodes(event);
      final decodedData = jsonDecode(dataTemp);
      final packageId = decodedData['package_id'];
      print('$decodedData');
      if (packageId == 802 && _isUploading) {
        setState(() {
          _isUploading = false;
        });

        showSuccessModalBottomSheet(
          context,
          title: 'Great!',
          message: "Config has been uploaded successfully",
          onConfirm: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
        );

        _subscribeStream?.cancel();
        _subscribeStream = null;
      }
    });
  }

  void _onUploadConfigFailed() {
    setState(() {
      _isUploading = false;
    });
    showErrorModalBottomSheet(
      context,
      title: "Can't upload configuration",
      message: "We're sorry, something has gone wrong. Please try later.",
    );
    _subscribeStream?.cancel();
    _subscribeStream = null;
  }

  Widget ItemSetting({
    required final String title,
    required final Widget menu,
    required final String value,
  }) {
    return InkWell(
      onTap: () async {
        dynamic value = await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return DetailScreenItemSettings(menu: menu);
            },
          ),
        );
        if (value == null) return;
        if (title == 'Fast Start') {
          setState(() {
            Setting.receivedFastStartNew = value;
          });
        } else if (title == 'Soft Start') {
          setState(() {
            Setting.receivedSoftStartNew = value;
          });
        } else if (title == 'Speed Limit') {
          setState(() {
            Setting.receivedSpeedLimit2 = value;
          });
        } else if (title == 'Overspeed') {
          setState(() {
            Setting.receivedDataOverSpeedNew = value;
          });
        } else if (title == 'Forward Reverse') {
          setState(() {
            Setting.receivedForwardReverse2 = value.toDouble();
          });
        } else if (title == 'Manual Cruise') {
          setState(() {
            Setting.receivedManualCruise2 = value.toDouble();
          });
        } else if (title == 'Auto Cruise') {
          setState(() {
            Setting.receivedAutoCruise2 = value.toDouble();
          });
        } else if (title == 'Reverse Speed Limit') {
          setState(() {
            Setting.receivedReverseSpeedLimitNew2 = value;
          });
        } else if (title == 'EBS Brake') {
          setState(() {
            Setting.receivedEbsBrakeNew2 = value.toDouble();
          });
        } else if (title == 'Battery Current Limit') {
          setState(() {
            Setting.receivedBatteryCurrentLimit2 = value.toDouble();
          });
        } else if (title == 'Phase Current Limit') {
          setState(() {
            Setting.receivedPhaseCurrentLimit2 = value.toDouble();
          });
        } else if (title == 'Low Voltage Threshold') {
          setState(() {
            Setting.receivedLowVoltageThreshold2 = value.toDouble();
          });
        } else if (title == 'Hall Sensor') {
          setState(() {
            Setting.receivedHallSensor2 = value.toDouble();
          });
        } else if (title == 'ECO Mode') {
          setState(() {
            Setting.receivedEcoMode = value.toDouble();
          });
        } else if (title == 'Adjust Accelerator') {
          setState(() {
            Setting.receivedAdjustAccelerator = value.toDouble();
          });
        } else if (title == 'Boost') {
          setState(() {
            Setting.receivedBoost2 = value.toDouble();
          });
        } else if (title == 'Motor Lock') {
          setState(() {
            Setting.receivedMotorLock = value.toDouble();
          });
        } else if (title == 'Tire Diameter') {
          setState(() {
            Setting.tireDiameter = value.toDouble();
          });
        }
        // else if (title == 'Sound') {
        //   setState(() {
        //     Setting.recievedSound = value.toDouble();
        //   });
        // }
      },
      child: Column(
        children: [
          ListTile(
            title: Text(
              '${title}',
              style: GoogleFonts.montserrat(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            subtitle: Text(
              '${value}',
              style: GoogleFonts.montserrat(
                color: darkGrey200,
                fontSize: 13.5,
              ),
            ),
            trailing: AppIcons.svg(
              'chevron_right',
              color: darkGrey200,
            ),
          ),
          Divider(
            color: darkGrey600,
            height: 1,
          ),
        ],
      ),
    );
  }
}
