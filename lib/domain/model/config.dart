import 'package:freezed_annotation/freezed_annotation.dart';

part 'config.freezed.dart';
part 'config.g.dart';

@freezed
class ConfigMode with _$ConfigMode {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory ConfigMode({
    required String id,
    required String name,
    String? code,
    String? description,
  }) = _ConfigMode;

  factory ConfigMode.fromJson(Map<String, dynamic> json) =>
      _$ConfigModeFromJson(json);
}