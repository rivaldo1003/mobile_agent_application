import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'config_result.freezed.dart';
part 'config_result.g.dart';

@freezed
class ConfigResult with _$ConfigResult {
  const factory ConfigResult({
    required List<TabItem> tabs,
    List<ConfigData>? configData,
  }) = _ConfigResult;

  factory ConfigResult.fromJson(Map<String, dynamic> json) =>
      _$ConfigResultFromJson(json);
}

@freezed
class ConfigData with _$ConfigData {
  const factory ConfigData({
    required String key,
    required String value,
    required int index,
  }) = _ConfigData;

  factory ConfigData.fromJson(Map<String, dynamic> json) =>
      _$ConfigDataFromJson(json);
}

@freezed
class TabItem with _$TabItem {
  const factory TabItem({
    required String key,
    required String title,
  }) = _TabItem;

  factory TabItem.fromJson(Map<String, dynamic> json) =>
      _$TabItemFromJson(json);
}
