// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponse<T> _$ApiResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ApiResponse<T>(
      message: json['message'] as String,
      code: json['code'],
      value: _$nullableGenericFromJson(json['value'], fromJsonT),
    );

Map<String, dynamic> _$ApiResponseToJson<T>(
  ApiResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'value': _$nullableGenericToJson(instance.value, toJsonT),
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);

ApiListResponse<T> _$ApiListResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ApiListResponse<T>(
      message: json['message'] as String,
      code: json['code'],
      value: (json['value'] as List<dynamic>?)?.map(fromJsonT).toList(),
    );

Map<String, dynamic> _$ApiListResponseToJson<T>(
  ApiListResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'value': instance.value?.map(toJsonT).toList(),
    };
