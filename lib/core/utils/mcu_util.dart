import 'dart:convert';

import 'package:elderselettricomobile/core/custom_exception.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

import '../../domain/model/mcu.dart';
import '../../presentation/configuration/settings_item_pages.dart';

String convertDataToJson({
  int? packageId,
  int? version,
  int? packageType,
  int? dataId,
  required List<Object> dataUploadItem,
}) {
  final mcuWrite = McuWrite(
    sn: 202212101,
    version: version ?? 1,
    packageId: packageId,
    packageType: packageType,
    dataId: dataId,
    data: McuData(dataLength: dataUploadItem.length, dataValue: dataUploadItem),
  );
  final jsonObject = mcuWrite.toJson();
  return JsonEncoder.withIndent('  ').convert(jsonObject);
}

McuObject parseCharacteristicValue(List<int> event) {
  final dataTemp = String.fromCharCodes(event);
  if (dataTemp.length < 22) throw McuParseException();

  final decodedData = jsonDecode(dataTemp);
  try {
    final mcuObject = McuObject.fromJson(decodedData);
    return mcuObject;
  } catch (e) {
    throw McuParseException();
  }
}

List<Object> getMcuDataUploadItems() {
  final dataUploadItem = [
    Setting.id_configuration,
    Setting.receivedFastStartNew![0],
    Setting.receivedSoftStartNew![0],
    Setting.receivedDataOverSpeedNew![0],
    Setting.receivedDataOverSpeedNew![1],
    Setting.receivedSpeedLimit2![0],
    Setting.receivedReverseSpeedLimitNew2![0],
    Setting.receivedEbsBrakeNew2!.toInt(),
    Setting.receivedBatteryCurrentLimit2!.toInt(),
    Setting.receivedPhaseCurrentLimit2!.toInt(),
    Setting.receivedLowVoltageThreshold2!.toInt(),
    Setting.dataEmpty,
    Setting.receivedFastStartNew![1],
    Setting.receivedSoftStartNew![1],
    Setting.receivedDataOverSpeedNew![2],
    Setting.receivedForwardReverse2!.toInt(),
    Setting.receivedManualCruise2!.toInt(),
    Setting.receivedAutoCruise2!.toInt(),
    Setting.receivedSpeedLimit2![1],
    Setting.receivedReverseSpeedLimitNew2![1],
    Setting.receivedHallSensor2!.toInt(),
    Setting.receivedEcoMode!.toInt(),
    Setting.receivedAdjustAccelerator!.toInt(),
    Setting.receivedBoost2!.toInt(),
    Setting.receivedMotorLock!.toInt(),
    Setting.crcData,
    Setting.id_end_data,
    // Setting.recievedSound!.toInt(),
  ];

  return dataUploadItem;
}

DeviceMode getDeviceMode(int? value) {
  switch (value) {
    case 0:
      return DeviceMode.motorLock;
    case 1:
      return DeviceMode.eco;
    case 2:
      return DeviceMode.normal;
    case 3:
      return DeviceMode.speed;
    case 4:
      return DeviceMode.motorOff;
    default:
      return DeviceMode.unknown;
  }
}

enum DeviceMode {
  motorLock('Motor Lock'),
  speed('Speed'),
  normal('Normal'),
  eco('Eco'),
  unknown('Unknown'),
  motorOff('Motor Off');

  final String text;

  const DeviceMode(this.text);
}

enum FaultCondition { normal, abnormal }

enum DeviceStatus {
  sensorless('Sensorless'),
  hallSensor('Hall Sensor');

  final String text;

  const DeviceStatus(this.text);
}

DeviceConnectionState? getMcuConnectionState(bool connected) {
  return connected
      ? DeviceConnectionState.connected
      : DeviceConnectionState.disconnected;
}

enum TelemetryState { loading, disconnected, error }

enum McuValue {
  battVoltage,
  battCurrent,
  temp,
  tripDistance,
  status,
  mode,
  avs,
  mxs,
  speed,
  breaking,
  rpm
}
