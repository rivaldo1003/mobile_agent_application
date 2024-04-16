import 'package:dartz/dartz.dart';

import '../model/config/config_value.dart';

abstract class ConfigRepository {
  Future<Either<Exception, ConfigValue>> saveConfig(ConfigValue data);

  Future<Either<Exception, List<ConfigValue>>> getCurrentConfigByGroupIds(
    List<int> groupIds,
    int controllerType,
  );

  Future<Either<Exception, List<ConfigValue>>> getCurrentConfigByController(
    int controllerType,
  );
}
