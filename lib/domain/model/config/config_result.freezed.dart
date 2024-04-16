// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'config_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ConfigResult _$ConfigResultFromJson(Map<String, dynamic> json) {
  return _ConfigResult.fromJson(json);
}

/// @nodoc
mixin _$ConfigResult {
  List<TabItem> get tabs => throw _privateConstructorUsedError;
  List<ConfigData>? get configData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConfigResultCopyWith<ConfigResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfigResultCopyWith<$Res> {
  factory $ConfigResultCopyWith(
          ConfigResult value, $Res Function(ConfigResult) then) =
      _$ConfigResultCopyWithImpl<$Res, ConfigResult>;
  @useResult
  $Res call({List<TabItem> tabs, List<ConfigData>? configData});
}

/// @nodoc
class _$ConfigResultCopyWithImpl<$Res, $Val extends ConfigResult>
    implements $ConfigResultCopyWith<$Res> {
  _$ConfigResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tabs = null,
    Object? configData = freezed,
  }) {
    return _then(_value.copyWith(
      tabs: null == tabs
          ? _value.tabs
          : tabs // ignore: cast_nullable_to_non_nullable
              as List<TabItem>,
      configData: freezed == configData
          ? _value.configData
          : configData // ignore: cast_nullable_to_non_nullable
              as List<ConfigData>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ConfigResultCopyWith<$Res>
    implements $ConfigResultCopyWith<$Res> {
  factory _$$_ConfigResultCopyWith(
          _$_ConfigResult value, $Res Function(_$_ConfigResult) then) =
      __$$_ConfigResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TabItem> tabs, List<ConfigData>? configData});
}

/// @nodoc
class __$$_ConfigResultCopyWithImpl<$Res>
    extends _$ConfigResultCopyWithImpl<$Res, _$_ConfigResult>
    implements _$$_ConfigResultCopyWith<$Res> {
  __$$_ConfigResultCopyWithImpl(
      _$_ConfigResult _value, $Res Function(_$_ConfigResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tabs = null,
    Object? configData = freezed,
  }) {
    return _then(_$_ConfigResult(
      tabs: null == tabs
          ? _value._tabs
          : tabs // ignore: cast_nullable_to_non_nullable
              as List<TabItem>,
      configData: freezed == configData
          ? _value._configData
          : configData // ignore: cast_nullable_to_non_nullable
              as List<ConfigData>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ConfigResult implements _ConfigResult {
  const _$_ConfigResult(
      {required final List<TabItem> tabs, final List<ConfigData>? configData})
      : _tabs = tabs,
        _configData = configData;

  factory _$_ConfigResult.fromJson(Map<String, dynamic> json) =>
      _$$_ConfigResultFromJson(json);

  final List<TabItem> _tabs;
  @override
  List<TabItem> get tabs {
    if (_tabs is EqualUnmodifiableListView) return _tabs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tabs);
  }

  final List<ConfigData>? _configData;
  @override
  List<ConfigData>? get configData {
    final value = _configData;
    if (value == null) return null;
    if (_configData is EqualUnmodifiableListView) return _configData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ConfigResult(tabs: $tabs, configData: $configData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ConfigResult &&
            const DeepCollectionEquality().equals(other._tabs, _tabs) &&
            const DeepCollectionEquality()
                .equals(other._configData, _configData));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_tabs),
      const DeepCollectionEquality().hash(_configData));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ConfigResultCopyWith<_$_ConfigResult> get copyWith =>
      __$$_ConfigResultCopyWithImpl<_$_ConfigResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ConfigResultToJson(
      this,
    );
  }
}

abstract class _ConfigResult implements ConfigResult {
  const factory _ConfigResult(
      {required final List<TabItem> tabs,
      final List<ConfigData>? configData}) = _$_ConfigResult;

  factory _ConfigResult.fromJson(Map<String, dynamic> json) =
      _$_ConfigResult.fromJson;

  @override
  List<TabItem> get tabs;
  @override
  List<ConfigData>? get configData;
  @override
  @JsonKey(ignore: true)
  _$$_ConfigResultCopyWith<_$_ConfigResult> get copyWith =>
      throw _privateConstructorUsedError;
}

ConfigData _$ConfigDataFromJson(Map<String, dynamic> json) {
  return _ConfigData.fromJson(json);
}

/// @nodoc
mixin _$ConfigData {
  String get key => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConfigDataCopyWith<ConfigData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfigDataCopyWith<$Res> {
  factory $ConfigDataCopyWith(
          ConfigData value, $Res Function(ConfigData) then) =
      _$ConfigDataCopyWithImpl<$Res, ConfigData>;
  @useResult
  $Res call({String key, String value, int index});
}

/// @nodoc
class _$ConfigDataCopyWithImpl<$Res, $Val extends ConfigData>
    implements $ConfigDataCopyWith<$Res> {
  _$ConfigDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? value = null,
    Object? index = null,
  }) {
    return _then(_value.copyWith(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ConfigDataCopyWith<$Res>
    implements $ConfigDataCopyWith<$Res> {
  factory _$$_ConfigDataCopyWith(
          _$_ConfigData value, $Res Function(_$_ConfigData) then) =
      __$$_ConfigDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String key, String value, int index});
}

/// @nodoc
class __$$_ConfigDataCopyWithImpl<$Res>
    extends _$ConfigDataCopyWithImpl<$Res, _$_ConfigData>
    implements _$$_ConfigDataCopyWith<$Res> {
  __$$_ConfigDataCopyWithImpl(
      _$_ConfigData _value, $Res Function(_$_ConfigData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? value = null,
    Object? index = null,
  }) {
    return _then(_$_ConfigData(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ConfigData implements _ConfigData {
  const _$_ConfigData(
      {required this.key, required this.value, required this.index});

  factory _$_ConfigData.fromJson(Map<String, dynamic> json) =>
      _$$_ConfigDataFromJson(json);

  @override
  final String key;
  @override
  final String value;
  @override
  final int index;

  @override
  String toString() {
    return 'ConfigData(key: $key, value: $value, index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ConfigData &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.index, index) || other.index == index));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, key, value, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ConfigDataCopyWith<_$_ConfigData> get copyWith =>
      __$$_ConfigDataCopyWithImpl<_$_ConfigData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ConfigDataToJson(
      this,
    );
  }
}

abstract class _ConfigData implements ConfigData {
  const factory _ConfigData(
      {required final String key,
      required final String value,
      required final int index}) = _$_ConfigData;

  factory _ConfigData.fromJson(Map<String, dynamic> json) =
      _$_ConfigData.fromJson;

  @override
  String get key;
  @override
  String get value;
  @override
  int get index;
  @override
  @JsonKey(ignore: true)
  _$$_ConfigDataCopyWith<_$_ConfigData> get copyWith =>
      throw _privateConstructorUsedError;
}

TabItem _$TabItemFromJson(Map<String, dynamic> json) {
  return _TabItem.fromJson(json);
}

/// @nodoc
mixin _$TabItem {
  String get key => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TabItemCopyWith<TabItem> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TabItemCopyWith<$Res> {
  factory $TabItemCopyWith(TabItem value, $Res Function(TabItem) then) =
      _$TabItemCopyWithImpl<$Res, TabItem>;
  @useResult
  $Res call({String key, String title});
}

/// @nodoc
class _$TabItemCopyWithImpl<$Res, $Val extends TabItem>
    implements $TabItemCopyWith<$Res> {
  _$TabItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TabItemCopyWith<$Res> implements $TabItemCopyWith<$Res> {
  factory _$$_TabItemCopyWith(
          _$_TabItem value, $Res Function(_$_TabItem) then) =
      __$$_TabItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String key, String title});
}

/// @nodoc
class __$$_TabItemCopyWithImpl<$Res>
    extends _$TabItemCopyWithImpl<$Res, _$_TabItem>
    implements _$$_TabItemCopyWith<$Res> {
  __$$_TabItemCopyWithImpl(_$_TabItem _value, $Res Function(_$_TabItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? title = null,
  }) {
    return _then(_$_TabItem(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TabItem implements _TabItem {
  const _$_TabItem({required this.key, required this.title});

  factory _$_TabItem.fromJson(Map<String, dynamic> json) =>
      _$$_TabItemFromJson(json);

  @override
  final String key;
  @override
  final String title;

  @override
  String toString() {
    return 'TabItem(key: $key, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TabItem &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, key, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TabItemCopyWith<_$_TabItem> get copyWith =>
      __$$_TabItemCopyWithImpl<_$_TabItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TabItemToJson(
      this,
    );
  }
}

abstract class _TabItem implements TabItem {
  const factory _TabItem(
      {required final String key, required final String title}) = _$_TabItem;

  factory _TabItem.fromJson(Map<String, dynamic> json) = _$_TabItem.fromJson;

  @override
  String get key;
  @override
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$_TabItemCopyWith<_$_TabItem> get copyWith =>
      throw _privateConstructorUsedError;
}
