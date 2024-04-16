import 'package:elderselettricomobile/domain/model/mcu.dart';

extension McudataExt on McuData {
  McuData800 to800() {
    return this as McuData800;
  }

  McuTelemetryData toTelemetry() {
    return this as McuTelemetryData;
  }

  McuData801 to801() {
    return this as McuData801;
  }

  McuData803 to803() {
    return this as McuData803;
  }
}
