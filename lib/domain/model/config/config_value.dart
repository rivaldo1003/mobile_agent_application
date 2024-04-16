import 'package:hive/hive.dart';

part 'config_value.g.dart';

@HiveType(typeId: 4)
class ConfigValue {
  @HiveField(0)
  int groupId;

  @HiveField(1)
  String name;

  @HiveField(2)
  String? description;

  @HiveField(3)
  List<dynamic> values;

  @HiveField(4)
  int controllerType;

  @HiveField(5)
  bool selected;

  ConfigValue({
    required this.groupId,
    required this.name,
    this.description,
    required this.values,
    required this.controllerType,
    required this.selected,
  });
}
