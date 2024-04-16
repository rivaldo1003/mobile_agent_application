import 'package:shared_preferences/shared_preferences.dart';

import '../../presentation/configuration/settings_item_pages.dart';

Future saveConfigDataToLocal(String deviceId) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setStringList('fastStart_${deviceId}', Setting.receivedFastStartNew!);
  pref.setStringList('softStart_${deviceId}', Setting.receivedSoftStartNew!);
  pref.setStringList('speedLimit_${deviceId}', Setting.receivedSpeedLimit2!);
  pref.setDouble('ebsBrake_${deviceId}', Setting.receivedEbsBrakeNew2!);
  pref.setStringList(
      'overSpeed_${deviceId}', Setting.receivedDataOverSpeedNew!);
  pref.setStringList('reverseSpeedLimit_${deviceId}',
      Setting.receivedReverseSpeedLimitNew2!);
  pref.setDouble('forwardReverse_${deviceId}', Setting.receivedForwardReverse2!);
  pref.setDouble('manualCruise_${deviceId}', Setting.receivedManualCruise2!);
  pref.setDouble('autoCruise_${deviceId}', Setting.receivedAutoCruise2!);
  pref.setDouble(
      'phaseCurrentLimit_${deviceId}', Setting.receivedPhaseCurrentLimit2!);
  pref.setDouble(
      'lowVoltageThreshold_${deviceId}', Setting.receivedLowVoltageThreshold2!);
  pref.setDouble(
      'batteryCurrentLimit_${deviceId}', Setting.receivedBatteryCurrentLimit2!);
  pref.setDouble('hallSensor_${deviceId}', Setting.receivedHallSensor2!);
  pref.setDouble('ecoMode_${deviceId}', Setting.receivedEcoMode!);
  pref.setDouble(
      'adjustAccelerator_${deviceId}', Setting.receivedAdjustAccelerator!);
  pref.setDouble('motorLock_${deviceId}', Setting.receivedMotorLock!);
  pref.setDouble('boost_${deviceId}', Setting.receivedBoost2!);
}

Future<void> loadConfigData(String deviceId) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  if (Setting.receivedFastStartNew == null) {
    Setting.receivedFastStartNew =
        pref.getStringList('fastStart_${deviceId}') ?? ['5', '1'];
    Setting.receivedSoftStartNew =
        pref.getStringList('softStart_${deviceId}') ?? ['5', '1'];
    Setting.receivedSpeedLimit2 =
        pref.getStringList('speedLimit_${deviceId}') ?? ['60', '0'];
    Setting.receivedEbsBrakeNew2 =
        pref.getDouble('ebsBrake_${deviceId}') ?? 5;
    Setting.receivedDataOverSpeedNew =
        pref.getStringList('overSpeed_${deviceId}') ?? ['10', '80', '1'];
    Setting.receivedReverseSpeedLimitNew2 =
        pref.getStringList('reverseSpeedLimit_${deviceId}') ?? ['30', '1'];
    Setting.receivedForwardReverse2 =
        pref.getDouble('forwardReverse_${deviceId}') ?? 1;
    Setting.receivedManualCruise2 =
        pref.getDouble('manualCruise_${deviceId}') ?? 1;
    Setting.receivedAutoCruise2 = pref.getDouble('autoCruise_') ?? 0;
    Setting.receivedPhaseCurrentLimit2 =
        pref.getDouble('phaseCurrentLimit_${deviceId}') ?? 100;
    Setting.receivedLowVoltageThreshold2 =
        pref.getDouble('lowVoltageThreshold_${deviceId}') ?? 40;

    Setting.receivedBatteryCurrentLimit2 =
        pref.getDouble('batteryCurrentLimit_${deviceId}') ?? 100;
    Setting.receivedHallSensor2 = pref.getDouble('hallSensor_${deviceId}') ?? 1;
    Setting.receivedEcoMode = pref.getDouble('ecoMode_${deviceId}') ?? 0;
    Setting.receivedAdjustAccelerator =
        pref.getDouble('adjustAccelerator_${deviceId}') ?? 0;
    Setting.receivedMotorLock = pref.getDouble('motorLock_${deviceId}') ?? 0;
    Setting.receivedBoost2 = pref.getDouble('boost_${deviceId}') ?? 1;
    Setting.tireDiameter = pref.getDouble('tireDiameter_${deviceId}') ?? 0.43;
  }
}

String geConfigLoggingData() {
  return 'Tire Diameter: ${Setting.tireDiameter}\n' +
      'Fast Start: ${Setting.receivedFastStartNew?[0]}\n' +
      'Soft Start: ${Setting.receivedSoftStartNew?[0]}\n' +
      'Speed Ratio: ${Setting.receivedDataOverSpeedNew?[0]}\n' +
      'Speed Limit: ${Setting.receivedSpeedLimit2?[0]}\n' +
      'Low Speed Ratio: ${Setting.receivedDataOverSpeedNew?[1]}\n' +
      'Reverse Speed Limit: ${Setting.receivedReverseSpeedLimitNew2?[0]}\n' +
      'EBS Brake: ${Setting.receivedEbsBrakeNew2?.toInt()}\n' +
      'Battery Current Limit: ${Setting.receivedBatteryCurrentLimit2?.toInt()}\n' +
      'Phase Current Limit: ${Setting.receivedPhaseCurrentLimit2?.toInt()}\n' +
      'Low Voltage Threshold: ${Setting.receivedLowVoltageThreshold2?.toInt()}\n' +
      'On/Off Fast Start: ${Setting.receivedFastStartNew?[1]}\n' +
      'On/Off Soft Start: ${Setting.receivedSoftStartNew?[1]}\n' +
      'On/Off Overspeed: ${Setting.receivedDataOverSpeedNew?[2]}\n' +
      'Forward Reverse: ${Setting.receivedForwardReverse2?.toInt()}\n' +
      'Manual Cruise: ${Setting.receivedManualCruise2?.toInt()}\n' +
      'Auto Cruise: ${Setting.receivedAutoCruise2?.toInt()}\n' +
      'On/Off Speed Limit: ${Setting.receivedSpeedLimit2?[1]}\n' +
      'On/Off Reverse Speed: ${Setting.receivedReverseSpeedLimitNew2?[1]}\n' +
      'Hall Sensor: ${Setting.receivedHallSensor2?.toInt()}\n' +
      'ECO Mode: ${Setting.receivedEcoMode?.toInt()}\n' +
      'Adjust Accelerator: ${Setting.receivedAdjustAccelerator?.toInt()}\n' +
      'Boost: ${Setting.receivedBoost2?.toInt()}\n' +
      'Motor Lock: ${Setting.receivedMotorLock?.toInt()}\n\n';
}