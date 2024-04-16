import 'package:elderselettricomobile/core/ble/ble_status_monitor.dart';
import 'package:elderselettricomobile/presentation/bluetooth/viewmodels/battery_viewmodel.dart';
import 'package:elderselettricomobile/presentation/configuration/viewmodel/configuration_viewmodel.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:nested/nested.dart';
import 'package:elderselettricomobile/core/ble/ble_device_connector.dart';
import 'package:elderselettricomobile/core/ble/ble_device_interactor.dart';
import 'package:elderselettricomobile/core/ble/ble_scanner.dart';
import 'package:provider/provider.dart';

import '../../presentation/bluetooth/viewmodels/rssi_viewmodel.dart';
import '../../presentation/bluetooth/viewmodels/vehicle_home_viewmodel.dart';
import '../../presentation/bluetooth/viewmodels/write_log_viewmodel.dart';
import '../../presentation/maps/viewmodels/maps_viewmodel.dart';
import '../../presentation/setting/profile_viewmodel.dart';

List<SingleChildWidget> getAppProviders() {
  final _ble = FlutterReactiveBle();
  final _scanner = BleScanner(ble: _ble);
  final _serviceDiscoverer = BleDeviceInteractor(ble: _ble);
  final _connector = BleDeviceConnector(ble: _ble);
  final _monitor = BleStatusMonitor(_ble);

  return [
    Provider.value(value: _scanner),
    Provider.value(value: _monitor),
    Provider.value(value: _connector),
    Provider.value(value: _serviceDiscoverer),
    StreamProvider<BleScannerState?>(
      create: (_) => _scanner.state,
      initialData: const BleScannerState(
        discoveredDevices: [],
        scanIsInProgress: false,
      ),
    ),
    StreamProvider<BleStatus?>(
      create: (_) => _monitor.state,
      initialData: BleStatus.unknown,
    ),
    StreamProvider<ConnectionStateUpdate>(
      create: (_) => _connector.state,
      initialData: const ConnectionStateUpdate(
        deviceId: 'Unknown device',
        connectionState: DeviceConnectionState.disconnected,
        failure: null,
      ),
    ),
    ChangeNotifierProvider(create: (_) => ProfileViewModel()),
    ChangeNotifierProvider(create: (_) => MapsViewModel()),
  ];
}

List<SingleChildWidget> getHomeProviders(String deviceId) {
  return [
    ChangeNotifierProvider(create: (_) => VehicleHomeViewModel()),
    ChangeNotifierProvider(create: (_) => RssiViewModel(deviceId)),
    ChangeNotifierProvider(create: (_) => WriteLogViewModel()),
    ChangeNotifierProvider(create: (_) => ConfigurationViewModel()),
    Provider(create: (_) => BatteryViewModel()),
  ];
}
