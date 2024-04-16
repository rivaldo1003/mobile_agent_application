import 'dart:async';

import 'package:elderselettricomobile/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../core/ble/ble_device_connector.dart';
import '../../../core/ble/ble_device_interactor.dart';
import '../../../flavors.dart';
import '../../core/app_providers.dart';
import '../../core/utils/mcu_util.dart';
import '../../core/values/colors.dart';
import '../../core/values/constants.dart';
import '../../core/values/icons.dart';
import '../../core/values/strings.dart';
import '../common/alert_bottom_sheet.dart';
import '../common/alert_info.dart';
import '../common/custom_bottom_navigation.dart';
import '../common/safe_on_tap.dart';
import '../common/text_style.dart';
import '../maps/map_screen.dart';
import '../maps/viewmodels/maps_viewmodel.dart';
import '../notification/notification_page.dart';
import '../setting/settings_page.dart';
import '../vehicle/select_vehicle_bottom_sheet.dart';
import '../vehicle/vehicle_list_viewmodel.dart';
import 'viewmodels/battery_viewmodel.dart';
import 'viewmodels/rssi_viewmodel.dart';
import 'viewmodels/vehicle_home_viewmodel.dart';
import 'viewmodels/write_log_viewmodel.dart';
import 'widgets/bluetooth_signal_icon.dart';
import 'widgets/characteristics_tile.dart';
import 'widgets/error_view.dart';
import 'widgets/unable_to_connect_indicator.dart';

class DeviceScreen extends StatelessWidget {
  const DeviceScreen({required this.deviceId});

  final String deviceId;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: getHomeProviders(deviceId),
      child: _MainPage(
        deviceId: deviceId,
        deviceInteractor: context.read<BleDeviceInteractor>(),
        deviceConnector: context.read<BleDeviceConnector>(),
      ),
    );
  }
}

class _MainPage extends StatefulWidget {
  _MainPage({
    required this.deviceId,
    required this.deviceConnector,
    required this.deviceInteractor,
  });

  final String deviceId;
  final BleDeviceConnector deviceConnector;
  final BleDeviceInteractor deviceInteractor;

  @override
  State<_MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<_MainPage> {
  final _ble = FlutterReactiveBle();
  DeviceConnectionState? _connectionState;
  List<DiscoveredService> _discoveredServices = [];
  StreamSubscription<BleStatus>? _bleStatusStream;
  StreamSubscription<ConnectionStateUpdate>? _connectionStream;
  Timer? _reconnectTimer;

  late String _deviceId;
  var _selectedTab = 0;
  var _discoverServiceCount = 0;

  var _bleStatus = BleStatus.unknown;
  var _isLoadingReconnectButton = false;
  var _isDisconnectFromUser = false;
  var _isDiscoveringService = false;
  var _isDiscoverServiceFailed = false;
  var _isInitConnectionState = true;

  double _homeVisibilityFraction = 1.0;

  void _selectedITab(int index) {
    if (_selectedTab == 0) {
      _isInitConnectionState = true;
      _discoverServiceCount = 0;
    }
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  void initState() {
    _deviceId = widget.deviceId;
    context.read<VehicleHomeViewModel>().getVehicleByDeviceId(_deviceId);

    _bleStatusStream = _ble.statusStream.listen((event) {
      if (!mounted) return;
      setState(() {
        _bleStatus = event;
      });

      if (_bleStatus == BleStatus.ready && _discoveredServices.isEmpty) {
        _connectDevice();
        _isDiscoveringService = true;
        _discoverServices();
      }
    });
    _startConnectedDeviceStream();
    context.read<WriteLogViewModel>().getWriteLogState();
    _getMcuDummyData();
    super.initState();
  }

  void _discoverServices() {
    Future.delayed(Duration(seconds: 1), () async {
      await _ble.requestMtu(deviceId: _deviceId, mtu: 223);
      if (_stateDisconnecting()) {
        setState(() {
          _isDiscoveringService = false;
        });
        return;
      }
      _startDiscoverServices();
    });
  }

  Future<void> _getMcuDummyData() async {}

  Future<void> _saveLastConnectedDevice() async {
    final pref = await SharedPreferences.getInstance();
    pref.setString(KEY_LAST_CONNECTED_DEVICE, _deviceId);
  }

  Future<void> _startDiscoverServices() async {
    try {
      final result = await widget.deviceInteractor.discoverServices(_deviceId);
      _discoveredServices = result;
      _checkDiscoveredServiceData();
      _isDiscoveringService = false;
    } on Exception {
      if (_stateDisconnecting()) {
        if (_isDiscoveringService) {
          setState(() {
            _isDiscoveringService = false;
          });
        }
        return;
      }

      if (_discoverServiceCount <= 5) {
        Future.delayed(Duration(seconds: _discoverServiceCount == 0 ? 5 : 3),
            () {
          _startDiscoverServices();
        });
        _discoverServiceCount++;
      } else {
        _isDiscoverServiceFailed = true;
        _isDiscoveringService = false;
      }
    } finally {
      if (mounted) setState(() {});
    }
  }

  void _checkDiscoveredServiceData() {
    final service = _discoveredServices.firstWhereOrNull(
        (element) => element.serviceId.toString() == SERVICE_UUID);
    if (service != null && service.characteristicIds.isEmpty) {
      _isDiscoverServiceFailed = true;
    } else {
      if (_isDiscoverServiceFailed) _isDiscoverServiceFailed = false;
    }
  }

  bool _stateDisconnecting() =>
      _connectionState == DeviceConnectionState.disconnected ||
      _connectionState == DeviceConnectionState.disconnecting;

  void _startConnectedDeviceStream() {
    _connectionStream = _ble.connectedDeviceStream.listen((event) {
      if (event.deviceId != _deviceId) return;
      _connectionState = event.connectionState;
      widget.deviceConnector.setConnectionStateUpdate(event);
      print(
          'BleDeviceConnector, DeviceScreen connection state: ${event.connectionState}');
      if (event.connectionState == DeviceConnectionState.disconnected) {
        context.read<RssiViewModel>().cancelStream();

        if (_isLoadingReconnectButton) {
          setState(() {
            _isLoadingReconnectButton = false;
          });
        }

        if (_isDisconnectFromUser) {
          _isDisconnectFromUser = false;
        } else {
          if (_discoveredServices.isNotEmpty && mounted) {
            _reconnectTimer = Timer(Duration(seconds: 3), () async {
              _connectDevice();
            });
          }
        }
      } else if (event.connectionState == DeviceConnectionState.connected) {
        if (_homeVisibilityFraction != 0.0)
          context.read<RssiViewModel>().setupRssiStream();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (_selectedTab == 0) ? homeAppBar() : null,
      bottomNavigationBar: MainBottomNavigation(
        selected: _selectedTab,
        onTap: _selectedITab,
      ),
      body: _selectedTab == 0
          ? VisibilityDetector(
              key: Key('VehicleHome'),
              onVisibilityChanged: _onHomePageVisibilityChanged,
              child: Home(),
            )
          : _selectedTab == 1
              ? MapScreen()
              : _selectedTab == 2
                  ? SettingPage(
                      onLogout: () {
                        _isDisconnectFromUser = true;
                        _disconnectDevice();
                      },
                    )
                  : null,
    );
  }

  AppBar homeAppBar() => AppBar(
        toolbarHeight: 70,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Container(
          child: Row(
            children: [
              Container(
                alignment: Alignment.center,
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: darkGrey800,
                ),
                child: Text(
                  'E',
                  style: GoogleFonts.montserrat(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome back',
                      style: AppTextStyle.title2,
                    ),
                    Text(
                      'Have a nice day!',
                      style: AppTextStyle.subtitle5,
                    )
                  ],
                ),
              ),
              SizedBox(width: 16),
              GestureDetector(
                onTap: () async {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return NotificationPage();
                  }));
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: AppIcons.svg('linear/bell'),
                ),
              )
            ],
          ),
        ),
      );

  void _onHomePageVisibilityChanged(VisibilityInfo visibilityInfo) {
    _homeVisibilityFraction = visibilityInfo.visibleFraction;
    final rssiModel = context.read<RssiViewModel>();
    if (_homeVisibilityFraction == 0.0) {
      _reconnectTimer?.cancel();
      _reconnectTimer = null;
      rssiModel.cancelStream();
      rssiModel.rssiStreamSub = null;
    } else {
      if (rssiModel.rssiStreamSub == null &&
          _connectionState == DeviceConnectionState.connected) {
        rssiModel.startRssiStream();
      }
    }
  }

  Widget Home() {
    final writeLogViewModel = context.read<WriteLogViewModel>();
    return Column(
      children: [
        (_bleStatus != BleStatus.ready && _discoveredServices.isNotEmpty)
            ? AlertInfo(
                message: 'Bluetooth adapter is ${_bleStatus.displayName}',
              )
            : Container(),
        FlavorConfig.dataLogSwitch(
            context.watch<WriteLogViewModel>().isWriteLog, (newValue) {
          writeLogViewModel.setWriteLogState(newValue);
          writeLogViewModel.saveWriteLogState();
        }),
        Container(
          padding: EdgeInsets.only(
            left: 16,
            top: 0,
            right: 16,
            bottom: 8,
          ),
          color: surfaceColor,
          child: Row(
            children: [
              GestureDetector(
                onTap: _showSelectVehicleBottomSheet,
                child:
                    Consumer<VehicleHomeViewModel>(builder: (_, viewModel, __) {
                  final state = viewModel.state;

                  return state.maybeWhen(
                    success: (data) {
                      context.read<MapsViewModel>().vehicle = data;
                      return Row(
                        children: [
                          Text(
                            data.vehicleName,
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(width: 4),
                          Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: AppIcons.svg('chevron_down'),
                          )
                        ],
                      );
                    },
                    orElse: () => Container(),
                  );
                }),
              ),
              Spacer(),
              BluetoothSignalIcon(rssi: context.watch<RssiViewModel>().state),
              SizedBox(width: 6),
              connectionStateButton(),
            ],
          ),
        ),
        (_bleStatus != BleStatus.ready && _discoveredServices.isEmpty)
            ? bluetoothOffIndicator()
            : _isDiscoveringService && !_isDiscoverServiceFailed
                ? loadingIndicator()
                : _discoveredServices.isNotEmpty && !_isDiscoverServiceFailed
                    ? Expanded(
                        child: SingleChildScrollView(
                          child: _buildServiceTiles(
                            _discoveredServices,
                            _deviceId,
                          ),
                        ),
                      )
                    : _isDiscoverServiceFailed
                        ? Expanded(
                            child: ErrorView(
                              title: 'Failed to get service',
                              messageList: [
                                AppStrings.failedGetDataTitle,
                                AppStrings.failedGetDataMessage,
                              ],
                              isLoading: _isDiscoveringService,
                              onTap: () {
                                _isDiscoveringService = true;
                                setState(() {});
                                _discoverServices();
                              },
                            ),
                          )
                        : UnableToConnectIndicator(
                            isLoading: _isLoadingReconnectButton,
                            onTap: _onReconnectDevice,
                          ),
      ],
    );
  }

  void _showSelectVehicleBottomSheet() {
    showRoundedBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (_) {
          return ChangeNotifierProvider(
            create: (_) => VehicleListViewModel(),
            child: SelectVehicle(
              currentDeviceId: _deviceId,
              currentDeviceState: _connectionState,
              batteryModel: context.read<BatteryViewModel>(),
              onVehicleDataUpdated: () {
                context
                    .read<VehicleHomeViewModel>()
                    .getVehicleByDeviceId(_deviceId);
              },
              onVehicleSelected: (deviceId) {
                final rssiModel = context.read<RssiViewModel>();
                if (rssiModel.rssiStreamSub != null) {
                  rssiModel.cancelStream()?.whenComplete(() {
                    rssiModel.rssiStreamSub = null;
                    _onVehicleSelected(deviceId);
                  });
                } else {
                  _onVehicleSelected(deviceId);
                }
              },
            ),
          );
        }).whenComplete(() {});
  }

  void _onReconnectDevice() {
    if (_isLoadingReconnectButton) return;
    setState(() {
      _isLoadingReconnectButton = true;
    });
    _connectDevice();
    Future.delayed(Duration(seconds: 1), () async {
      _startDiscoverServices();
    });
  }

  void _onVehicleSelected(String deviceId) {
    _isInitConnectionState = true;
    _disconnectDevice();
    this._deviceId = deviceId;
    context.read<VehicleHomeViewModel>().getVehicleByDeviceId(deviceId);
    context.read<BatteryViewModel>().resetBatteryData();
    _connectDevice();
    _discoveredServices = [];
    _isDiscoveringService = true;
    setState(() {});
    _discoverServices();
  }

  Widget _buildServiceTiles(
    List<DiscoveredService> services,
    String deviceId,
  ) {
    final viewModel = context.watch<VehicleHomeViewModel>();
    if (_connectionState != DeviceConnectionState.disconnected) {
      _ble.requestMtu(deviceId: deviceId, mtu: 223);
    }

    final service = services.firstWhereOrNull(
        (element) => element.serviceId.toString() == SERVICE_UUID);

    if (service == null) {
      return Container();
    } else {
      if (service.characteristics.isEmpty) return Container();
      final rxCharacteristic = service.characteristics.firstWhere((element) =>
          element.characteristicId.toString() == CHARACTERISTIC_UUID_RX);

      final txCharacteristic = service.characteristics.firstWhere((element) =>
          element.characteristicId.toString() == CHARACTERISTIC_UUID_TX);

      final readCharacteristic =
          txCharacteristic.toQualifiedCharacteristic(deviceId);

      final writeCharacteristic =
          rxCharacteristic.toQualifiedCharacteristic(deviceId);

      return viewModel.state.maybeWhen(
        success: (vehicle) => CharacteristicTile(
          vehicle: vehicle,
          connectionState: _connectionState,
          characteristic: readCharacteristic,
          writeCharacteristic: writeCharacteristic,
          onConnectionStateReceived: (data) {
            if (!_isInitConnectionState) return;
            if (context.read<RssiViewModel>().rssiStreamSub == null) {
              context.read<RssiViewModel>().startRssiStream();
            }

            _saveLastConnectedDevice();

            if (data == null) return;
            widget.deviceConnector.updateConnection(deviceId, data.isConnected);
            _connectionState = getMcuConnectionState(data.isConnected);
            _isInitConnectionState = false;
          },
          onDataReceived: (data) {
            context.read<WriteLogViewModel>().writeToLog(data);
          },
        ),
        orElse: () => Container(),
      );
    }
  }

  Widget bluetoothOffIndicator() => Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppIcons.svg('bluetooth_disconnected', height: 100, width: 100),
            SizedBox(height: 24),
            Text(
              'Bluetooth adapter is ${_bleStatus.displayName}.',
              style: AppTextStyle.title4,
            ),
          ],
        ),
      );

  Widget loadingIndicator() => Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 35,
              height: 35,
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          ],
        ),
      );

  Widget connectionStateButton() {
    return Consumer<ConnectionStateUpdate>(
      builder: (_, connectionStateUpdate, __) {
        final state = connectionStateUpdate.connectionState;
        return SafeOnTap(
          intervalMs: 2500,
          onSafeTap: () {
            if (_connectionState == DeviceConnectionState.disconnected) {
              _connectDevice();

              if (_discoveredServices.isEmpty) {
                setState(() {
                  _isDiscoveringService = true;
                });
              }

              Future.delayed(Duration(seconds: 1), () async {
                _startDiscoverServices();
              });
            } else {
              _isDisconnectFromUser = true;
              _disconnectDevice();
            }
          },
          child: Container(
            padding: EdgeInsets.only(left: 8, top: 6, right: 8, bottom: 6),
            decoration: BoxDecoration(
              color: state == DeviceConnectionState.disconnected
                  ? darkGrey600
                  : Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                AppIcons.svg(
                  'dot',
                  color: Colors.white,
                ),
                SizedBox(width: 7),
                Text(
                  connectionStateUpdate.connectionState.name.toUpperCase(),
                  style: GoogleFonts.montserrat(
                    color: state == DeviceConnectionState.disconnected
                        ? darkGrey200
                        : Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _connectDevice() {
    if (_ble.status == BleStatus.ready)
      widget.deviceConnector.connect(_deviceId);
  }

  void _disconnectDevice() => widget.deviceConnector.disconnect(_deviceId);

  @override
  void dispose() {
    _connectionStream?.cancel();
    _bleStatusStream?.cancel();
    super.dispose();
  }
}
