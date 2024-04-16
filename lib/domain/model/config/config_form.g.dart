// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ConfigFormGroup _$$_ConfigFormGroupFromJson(Map<String, dynamic> json) =>
    _$_ConfigFormGroup(
      title: json['title'] as String?,
      child: (json['child'] as List<dynamic>)
          .map((e) => ConfigForm.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ConfigFormGroupToJson(_$_ConfigFormGroup instance) =>
    <String, dynamic>{
      'title': instance.title,
      'child': instance.child,
    };

_$_ConfigForm _$$_ConfigFormFromJson(Map<String, dynamic> json) =>
    _$_ConfigForm(
      title: json['title'] as String,
      inputType: json['inputType'] as String,
      min: json['min'] as int?,
      max: json['max'] as int?,
      defaultValue: json['defaultValue'],
      unit: json['unit'] as String?,
      index: json['index'] as int?,
      selections: (json['selections'] as List<dynamic>?)
              ?.map((e) => SelectionItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      enabled: json['enabled'] as bool? ?? false,
      showEnabled: json['showEnabled'] as bool? ?? false,
    );

Map<String, dynamic> _$$_ConfigFormToJson(_$_ConfigForm instance) =>
    <String, dynamic>{
      'title': instance.title,
      'inputType': instance.inputType,
      'min': instance.min,
      'max': instance.max,
      'defaultValue': instance.defaultValue,
      'unit': instance.unit,
      'index': instance.index,
      'selections': instance.selections,
      'enabled': instance.enabled,
      'showEnabled': instance.showEnabled,
    };

_$_SelectionItem _$$_SelectionItemFromJson(Map<String, dynamic> json) =>
    _$_SelectionItem(
      key: json['key'] as String?,
      label: json['label'] as String?,
    );

Map<String, dynamic> _$$_SelectionItemToJson(_$_SelectionItem instance) =>
    <String, dynamic>{
      'key': instance.key,
      'label': instance.label,
    };
