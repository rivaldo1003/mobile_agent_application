// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ConfigResult _$$_ConfigResultFromJson(Map<String, dynamic> json) =>
    _$_ConfigResult(
      tabs: (json['tabs'] as List<dynamic>)
          .map((e) => TabItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      configData: (json['configData'] as List<dynamic>?)
          ?.map((e) => ConfigData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ConfigResultToJson(_$_ConfigResult instance) =>
    <String, dynamic>{
      'tabs': instance.tabs,
      'configData': instance.configData,
    };

_$_ConfigData _$$_ConfigDataFromJson(Map<String, dynamic> json) =>
    _$_ConfigData(
      key: json['key'] as String,
      value: json['value'] as String,
      index: json['index'] as int,
    );

Map<String, dynamic> _$$_ConfigDataToJson(_$_ConfigData instance) =>
    <String, dynamic>{
      'key': instance.key,
      'value': instance.value,
      'index': instance.index,
    };

_$_TabItem _$$_TabItemFromJson(Map<String, dynamic> json) => _$_TabItem(
      key: json['key'] as String,
      title: json['title'] as String,
    );

Map<String, dynamic> _$$_TabItemToJson(_$_TabItem instance) =>
    <String, dynamic>{
      'key': instance.key,
      'title': instance.title,
    };
