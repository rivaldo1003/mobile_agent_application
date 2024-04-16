import '../../../core/utils/hive_util.dart';
import '../../../domain/model/config/config_value.dart';

class ConfigLocalDataSource {
  Future<List<ConfigValue>> getCurrentConfigByGroupIds(
    List<int> groupIds,
    int controllerType,
  ) async {
    final configBox = HiveHelper.configBox();
    final configKeys = configBox.keys.toList();
    List<ConfigValue> configs = [];
    await Future.wait(configKeys.map((id) async {
      final config = await configBox.get(id);
      if (config != null &&
          groupIds.contains(config.groupId) &&
          config.controllerType == controllerType &&
          config.selected) {
        configs.add(config);
      }
    }));
    return configs;
  }

  Future<List<ConfigValue>> getAllConfigsByControllerType(
    int controllerType,
  ) async {
    final configBox = HiveHelper.configBox();
    final configKeys = configBox.keys.toList();
    List<ConfigValue> configs = [];
    await Future.wait(configKeys.map((id) async {
      final config = await configBox.get(id);
      if (config != null && config.controllerType == controllerType) {
        configs.add(config);
      }
    }));
    return configs;
  }

  Future<ConfigValue> saveConfig(ConfigValue config) async {
    final configBox = HiveHelper.configBox();
    await configBox.add(config);
    return config;
  }
}
