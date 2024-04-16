// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ConfigMode _$ConfigModeFromJson(Map<String, dynamic> json) {
  return _ConfigMode.fromJson(json);
}

/// @nodoc
mixin _$ConfigMode {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConfigModeCopyWith<ConfigMode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfigModeCopyWith<$Res> {
  factory $ConfigModeCopyWith(
          ConfigMode value, $Res Function(ConfigMode) then) =
      _$ConfigModeCopyWithImpl<$Res, ConfigMode>;
  @useResult
  $Res call({String id, String name, String? code, String? description});
}

/// @nodoc
class _$ConfigModeCopyWithImpl<$Res, $Val extends ConfigMode>
    implements $ConfigModeCopyWith<$Res> {
  _$ConfigModeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? code = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ConfigModeCopyWith<$Res>
    implements $ConfigModeCopyWith<$Res> {
  factory _$$_ConfigModeCopyWith(
          _$_ConfigMode value, $Res Function(_$_ConfigMode) then) =
      __$$_ConfigModeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String? code, String? description});
}

/// @nodoc
class __$$_ConfigModeCopyWithImpl<$Res>
    extends _$ConfigModeCopyWithImpl<$Res, _$_ConfigMode>
    implements _$$_ConfigModeCopyWith<$Res> {
  __$$_ConfigModeCopyWithImpl(
      _$_ConfigMode _value, $Res Function(_$_ConfigMode) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? code = freezed,
    Object? description = freezed,
  }) {
    return _then(_$_ConfigMode(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_ConfigMode implements _ConfigMode {
  const _$_ConfigMode(
      {required this.id, required this.name, this.code, this.description});

  factory _$_ConfigMode.fromJson(Map<String, dynamic> json) =>
      _$$_ConfigModeFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? code;
  @override
  final String? description;

  @override
  String toString() {
    return 'ConfigMode(id: $id, name: $name, code: $code, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ConfigMode &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, code, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ConfigModeCopyWith<_$_ConfigMode> get copyWith =>
      __$$_ConfigModeCopyWithImpl<_$_ConfigMode>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ConfigModeToJson(
      this,
    );
  }
}

abstract class _ConfigMode implements ConfigMode {
  const factory _ConfigMode(
      {required final String id,
      required final String name,
      final String? code,
      final String? description}) = _$_ConfigMode;

  factory _ConfigMode.fromJson(Map<String, dynamic> json) =
      _$_ConfigMode.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get code;
  @override
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$_ConfigModeCopyWith<_$_ConfigMode> get copyWith =>
      throw _privateConstructorUsedError;
}
