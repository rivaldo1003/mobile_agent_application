import 'dart:async';

import 'package:elderselettricomobile/core/values/constants.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

import 'reactive_state.dart';

class BleDeviceConnector extends ReactiveState<ConnectionStateUpdate> {
  BleDeviceConnector({
    required FlutterReactiveBle ble,
  }) : _ble = ble;

  final FlutterReactiveBle _ble;

  @override
  Stream<ConnectionStateUpdate> get state => _deviceConnectionController.stream;

  final _deviceConnectionController = StreamController<ConnectionStateUpdate>();

  StreamSubscription<ConnectionStateUpdate>? _connection;

  Future<void> connect(String deviceId) async {
    print('BleDeviceConnector, connect to device: ${deviceId}');
    _connection = _ble
        .connectToDevice(
      id: deviceId,
      connectionTimeout: const Duration(seconds: 10),
    )
        .listen(
      (update) {
        print(
            'BleDeviceConnector, connection state for ${deviceId}: ${update.connectionState}');
        _deviceConnectionController.add(update);
      },
      onError: (Object e) => print(
          'BleDeviceConnector, connecting to device ${deviceId} resulted in error $e'),
    );
  }

  Future<void> disconnect(String deviceId) async {
    print('BleDeviceConnector, disconnect device: ${deviceId}');
    try {
      await _connection?.cancel();
    } on Exception catch (e, _) {
      print("BleDeviceConnector, error disconnecting device: $e");
    } finally {
      _deviceConnectionController.add(
        ConnectionStateUpdate(
          deviceId: deviceId,
          connectionState: DeviceConnectionState.disconnected,
          failure: null,
        ),
      );
    }
  }

  void connectToAdvertisingDevice(String deviceId) {
    _ble
        .connectToAdvertisingDevice(
            id: deviceId,
            withServices: [Uuid.parse(SERVICE_UUID)],
            prescanDuration: const Duration(seconds: 3),
            connectionTimeout: const Duration(seconds: 3))
        .listen((update) {
      _deviceConnectionController.add(update);
    });
  }

  void updateConnection(String deviceId, bool connected) {
    _deviceConnectionController.add(
      ConnectionStateUpdate(
        deviceId: deviceId,
        connectionState: connected
            ? DeviceConnectionState.connected
            : DeviceConnectionState.disconnected,
        failure: null,
      ),
    );
  }

  void setConnectionStateUpdate(ConnectionStateUpdate value) {
    _deviceConnectionController.add(value);
  }

  Future<void> dispose() async {
    await _deviceConnectionController.close();
  }
}
