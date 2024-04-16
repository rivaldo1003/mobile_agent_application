import 'package:dartz/dartz.dart';
import 'package:elderselettricomobile/domain/model/mcu_connect.dart';

abstract class DeviceRepository {
  Future<Either<Exception, McuConnectResult>> connectMCU(String deviceId, String deviceName, String? clientId);
}