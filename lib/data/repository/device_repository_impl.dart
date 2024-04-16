import 'package:dartz/dartz.dart';
import 'package:elderselettricomobile/domain/model/mcu_connect.dart';
import 'package:elderselettricomobile/domain/repository/device_repository.dart';

import '../source/remote/device_remote_datasource.dart';

class DeviceRepositoryImpl extends DeviceRepository {
  final DeviceRemoteDataSource remoteDataSource;

  DeviceRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Exception, McuConnectResult>> connectMCU(
    String deviceId,
    String deviceName,
    String? clientId,
  ) {
    final nameSplit = deviceName.split(' ');
    final model = nameSplit.length > 1 ? nameSplit[1] : '';
    return remoteDataSource.connectMcu(deviceId, model, deviceName, clientId);
  }
}
