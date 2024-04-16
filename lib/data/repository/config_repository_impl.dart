import 'package:elderselettricomobile/data/source/local/config_local_datasource.dart';
import 'package:dartz/dartz.dart';
import 'package:elderselettricomobile/domain/repository/config_repository.dart';

import '../../domain/model/config/config_value.dart';

class ConfigRepositoryImpl extends ConfigRepository {
  final ConfigLocalDataSource localDataSource;

  ConfigRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Exception, ConfigValue>> saveConfig(ConfigValue data) async {
    final result = await localDataSource.saveConfig(data);
    return Right(result);
  }

  @override
  Future<Either<Exception, List<ConfigValue>>> getCurrentConfigByGroupIds(
      List<int> groupIds, int controllerType) async {
    final result = await localDataSource.getCurrentConfigByGroupIds(
        groupIds, controllerType);
    return Right(result);
  }

  @override
  Future<Either<Exception, List<ConfigValue>>> getCurrentConfigByController(
      int controllerType) async {
    final result =
        await localDataSource.getAllConfigsByControllerType(controllerType);
    return Right(result);
  }
}
