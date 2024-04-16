import 'dart:async';

import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

class BleDeviceInteractor {
  BleDeviceInteractor({
    required FlutterReactiveBle ble,
  }) : _ble = ble;

  final FlutterReactiveBle _ble;

  Future<List<DiscoveredService>> discoverServices(String deviceId) async {
    print("BleDeviceInteractor, Start discover service");
    try {
      final result =
          await _ble.discoverServices(deviceId).timeout(Duration(milliseconds: 5500));
      return result;
    } on Exception catch (e) {
      rethrow;
    }
  }

  Future<void> writeCharacteristicWithResponse(
      QualifiedCharacteristic characteristic, List<int> value) async {
    try {
      await _ble
          .writeCharacteristicWithResponse(characteristic, value: value)
          .timeout(Duration(seconds: 4));
    } on Exception {
      rethrow;
    }
  }

  Future<void> writeCharacteristicWithoutResponse(
      QualifiedCharacteristic characteristic, List<int> value) async {
    try {
      await _ble.writeCharacteristicWithoutResponse(characteristic,
          value: value);
    } on Exception {
      rethrow;
    }
  }

  Stream<List<int>> subscribeToCharacteristic(
      QualifiedCharacteristic characteristic) {
    print("BleDeviceInteractor, Start subscribe to characteristic");
    return _ble
        .subscribeToCharacteristic(characteristic)
        .timeout(Duration(seconds: 4));
  }

  Stream<int> streamRssi(
    String deviceId, {
    Duration rssiPeriod = const Duration(seconds: 1),
  }) {
    print("BleDeviceInteractor, Start stream rssi");
    return _ble.streamRssi(deviceId, rssiPeriod: rssiPeriod);
  }
}
