// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'config_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ConfigFormGroup _$ConfigFormGroupFromJson(Map<String, dynamic> json) {
  return _ConfigFormGroup.fromJson(json);
}

/// @nodoc
mixin _$ConfigFormGroup {
  String? get title => throw _privateConstructorUsedError;
  List<ConfigForm> get child => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConfigFormGroupCopyWith<ConfigFormGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfigFormGroupCopyWith<$Res> {
  factory $ConfigFormGroupCopyWith(
          ConfigFormGroup value, $Res Function(ConfigFormGroup) then) =
      _$ConfigFormGroupCopyWithImpl<$Res, ConfigFormGroup>;
  @useResult
  $Res call({String? title, List<ConfigForm> child});
}

/// @nodoc
class _$ConfigFormGroupCopyWithImpl<$Res, $Val extends ConfigFormGroup>
    implements $ConfigFormGroupCopyWith<$Res> {
  _$ConfigFormGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? child = null,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      child: null == child
          ? _value.child
          : child // ignore: cast_nullable_to_non_nullable
              as List<ConfigForm>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ConfigFormGroupCopyWith<$Res>
    implements $ConfigFormGroupCopyWith<$Res> {
  factory _$$_ConfigFormGroupCopyWith(
          _$_ConfigFormGroup value, $Res Function(_$_ConfigFormGroup) then) =
      __$$_ConfigFormGroupCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? title, List<ConfigForm> child});
}

/// @nodoc
class __$$_ConfigFormGroupCopyWithImpl<$Res>
    extends _$ConfigFormGroupCopyWithImpl<$Res, _$_ConfigFormGroup>
    implements _$$_ConfigFormGroupCopyWith<$Res> {
  __$$_ConfigFormGroupCopyWithImpl(
      _$_ConfigFormGroup _value, $Res Function(_$_ConfigFormGroup) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? child = null,
  }) {
    return _then(_$_ConfigFormGroup(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      child: null == child
          ? _value._child
          : child // ignore: cast_nullable_to_non_nullable
              as List<ConfigForm>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ConfigFormGroup implements _ConfigFormGroup {
  const _$_ConfigFormGroup({this.title, required final List<ConfigForm> child})
      : _child = child;

  factory _$_ConfigFormGroup.fromJson(Map<String, dynamic> json) =>
      _$$_ConfigFormGroupFromJson(json);

  @override
  final String? title;
  final List<ConfigForm> _child;
  @override
  List<ConfigForm> get child {
    if (_child is EqualUnmodifiableListView) return _child;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_child);
  }

  @override
  String toString() {
    return 'ConfigFormGroup(title: $title, child: $child)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ConfigFormGroup &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._child, _child));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, title, const DeepCollectionEquality().hash(_child));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ConfigFormGroupCopyWith<_$_ConfigFormGroup> get copyWith =>
      __$$_ConfigFormGroupCopyWithImpl<_$_ConfigFormGroup>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ConfigFormGroupToJson(
      this,
    );
  }
}

abstract class _ConfigFormGroup implements ConfigFormGroup {
  const factory _ConfigFormGroup(
      {final String? title,
      required final List<ConfigForm> child}) = _$_ConfigFormGroup;

  factory _ConfigFormGroup.fromJson(Map<String, dynamic> json) =
      _$_ConfigFormGroup.fromJson;

  @override
  String? get title;
  @override
  List<ConfigForm> get child;
  @override
  @JsonKey(ignore: true)
  _$$_ConfigFormGroupCopyWith<_$_ConfigFormGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

ConfigForm _$ConfigFormFromJson(Map<String, dynamic> json) {
  return _ConfigForm.fromJson(json);
}

/// @nodoc
mixin _$ConfigForm {
  String get title => throw _privateConstructorUsedError;
  String get inputType => throw _privateConstructorUsedError;
  int? get min => throw _privateConstructorUsedError;
  int? get max => throw _privateConstructorUsedError;
  dynamic get defaultValue => throw _privateConstructorUsedError;
  String? get unit => throw _privateConstructorUsedError;
  int? get index => throw _privateConstructorUsedError;
  List<SelectionItem> get selections => throw _privateConstructorUsedError;
  bool get enabled => throw _privateConstructorUsedError;
  bool get showEnabled => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConfigFormCopyWith<ConfigForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfigFormCopyWith<$Res> {
  factory $ConfigFormCopyWith(
          ConfigForm value, $Res Function(ConfigForm) then) =
      _$ConfigFormCopyWithImpl<$Res, ConfigForm>;
  @useResult
  $Res call(
      {String title,
      String inputType,
      int? min,
      int? max,
      dynamic defaultValue,
      String? unit,
      int? index,
      List<SelectionItem> selections,
      bool enabled,
      bool showEnabled});
}

/// @nodoc
class _$ConfigFormCopyWithImpl<$Res, $Val extends ConfigForm>
    implements $ConfigFormCopyWith<$Res> {
  _$ConfigFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? inputType = null,
    Object? min = freezed,
    Object? max = freezed,
    Object? defaultValue = freezed,
    Object? unit = freezed,
    Object? index = freezed,
    Object? selections = null,
    Object? enabled = null,
    Object? showEnabled = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      inputType: null == inputType
          ? _value.inputType
          : inputType // ignore: cast_nullable_to_non_nullable
              as String,
      min: freezed == min
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as int?,
      max: freezed == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as int?,
      defaultValue: freezed == defaultValue
          ? _value.defaultValue
          : defaultValue // ignore: cast_nullable_to_non_nullable
              as dynamic,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
      selections: null == selections
          ? _value.selections
          : selections // ignore: cast_nullable_to_non_nullable
              as List<SelectionItem>,
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      showEnabled: null == showEnabled
          ? _value.showEnabled
          : showEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ConfigFormCopyWith<$Res>
    implements $ConfigFormCopyWith<$Res> {
  factory _$$_ConfigFormCopyWith(
          _$_ConfigForm value, $Res Function(_$_ConfigForm) then) =
      __$$_ConfigFormCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String inputType,
      int? min,
      int? max,
      dynamic defaultValue,
      String? unit,
      int? index,
      List<SelectionItem> selections,
      bool enabled,
      bool showEnabled});
}

/// @nodoc
class __$$_ConfigFormCopyWithImpl<$Res>
    extends _$ConfigFormCopyWithImpl<$Res, _$_ConfigForm>
    implements _$$_ConfigFormCopyWith<$Res> {
  __$$_ConfigFormCopyWithImpl(
      _$_ConfigForm _value, $Res Function(_$_ConfigForm) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? inputType = null,
    Object? min = freezed,
    Object? max = freezed,
    Object? defaultValue = freezed,
    Object? unit = freezed,
    Object? index = freezed,
    Object? selections = null,
    Object? enabled = null,
    Object? showEnabled = null,
  }) {
    return _then(_$_ConfigForm(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      inputType: null == inputType
          ? _value.inputType
          : inputType // ignore: cast_nullable_to_non_nullable
              as String,
      min: freezed == min
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as int?,
      max: freezed == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as int?,
      defaultValue: freezed == defaultValue
          ? _value.defaultValue
          : defaultValue // ignore: cast_nullable_to_non_nullable
              as dynamic,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
      selections: null == selections
          ? _value._selections
          : selections // ignore: cast_nullable_to_non_nullable
              as List<SelectionItem>,
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      showEnabled: null == showEnabled
          ? _value.showEnabled
          : showEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ConfigForm implements _ConfigForm {
  const _$_ConfigForm(
      {required this.title,
      required this.inputType,
      this.min,
      this.max,
      this.defaultValue,
      this.unit,
      this.index,
      final List<SelectionItem> selections = const [],
      this.enabled = false,
      this.showEnabled = false})
      : _selections = selections;

  factory _$_ConfigForm.fromJson(Map<String, dynamic> json) =>
      _$$_ConfigFormFromJson(json);

  @override
  final String title;
  @override
  final String inputType;
  @override
  final int? min;
  @override
  final int? max;
  @override
  final dynamic defaultValue;
  @override
  final String? unit;
  @override
  final int? index;
  final List<SelectionItem> _selections;
  @override
  @JsonKey()
  List<SelectionItem> get selections {
    if (_selections is EqualUnmodifiableListView) return _selections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selections);
  }

  @override
  @JsonKey()
  final bool enabled;
  @override
  @JsonKey()
  final bool showEnabled;

  @override
  String toString() {
    return 'ConfigForm(title: $title, inputType: $inputType, min: $min, max: $max, defaultValue: $defaultValue, unit: $unit, index: $index, selections: $selections, enabled: $enabled, showEnabled: $showEnabled)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ConfigForm &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.inputType, inputType) ||
                other.inputType == inputType) &&
            (identical(other.min, min) || other.min == min) &&
            (identical(other.max, max) || other.max == max) &&
            const DeepCollectionEquality()
                .equals(other.defaultValue, defaultValue) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.index, index) || other.index == index) &&
            const DeepCollectionEquality()
                .equals(other._selections, _selections) &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.showEnabled, showEnabled) ||
                other.showEnabled == showEnabled));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      inputType,
      min,
      max,
      const DeepCollectionEquality().hash(defaultValue),
      unit,
      index,
      const DeepCollectionEquality().hash(_selections),
      enabled,
      showEnabled);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ConfigFormCopyWith<_$_ConfigForm> get copyWith =>
      __$$_ConfigFormCopyWithImpl<_$_ConfigForm>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ConfigFormToJson(
      this,
    );
  }
}

abstract class _ConfigForm implements ConfigForm {
  const factory _ConfigForm(
      {required final String title,
      required final String inputType,
      final int? min,
      final int? max,
      final dynamic defaultValue,
      final String? unit,
      final int? index,
      final List<SelectionItem> selections,
      final bool enabled,
      final bool showEnabled}) = _$_ConfigForm;

  factory _ConfigForm.fromJson(Map<String, dynamic> json) =
      _$_ConfigForm.fromJson;

  @override
  String get title;
  @override
  String get inputType;
  @override
  int? get min;
  @override
  int? get max;
  @override
  dynamic get defaultValue;
  @override
  String? get unit;
  @override
  int? get index;
  @override
  List<SelectionItem> get selections;
  @override
  bool get enabled;
  @override
  bool get showEnabled;
  @override
  @JsonKey(ignore: true)
  _$$_ConfigFormCopyWith<_$_ConfigForm> get copyWith =>
      throw _privateConstructorUsedError;
}

SelectionItem _$SelectionItemFromJson(Map<String, dynamic> json) {
  return _SelectionItem.fromJson(json);
}

/// @nodoc
mixin _$SelectionItem {
  String? get key => throw _privateConstructorUsedError;
  String? get label => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SelectionItemCopyWith<SelectionItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectionItemCopyWith<$Res> {
  factory $SelectionItemCopyWith(
          SelectionItem value, $Res Function(SelectionItem) then) =
      _$SelectionItemCopyWithImpl<$Res, SelectionItem>;
  @useResult
  $Res call({String? key, String? label});
}

/// @nodoc
class _$SelectionItemCopyWithImpl<$Res, $Val extends SelectionItem>
    implements $SelectionItemCopyWith<$Res> {
  _$SelectionItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = freezed,
    Object? label = freezed,
  }) {
    return _then(_value.copyWith(
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SelectionItemCopyWith<$Res>
    implements $SelectionItemCopyWith<$Res> {
  factory _$$_SelectionItemCopyWith(
          _$_SelectionItem value, $Res Function(_$_SelectionItem) then) =
      __$$_SelectionItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? key, String? label});
}

/// @nodoc
class __$$_SelectionItemCopyWithImpl<$Res>
    extends _$SelectionItemCopyWithImpl<$Res, _$_SelectionItem>
    implements _$$_SelectionItemCopyWith<$Res> {
  __$$_SelectionItemCopyWithImpl(
      _$_SelectionItem _value, $Res Function(_$_SelectionItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = freezed,
    Object? label = freezed,
  }) {
    return _then(_$_SelectionItem(
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SelectionItem implements _SelectionItem {
  const _$_SelectionItem({this.key, this.label});

  factory _$_SelectionItem.fromJson(Map<String, dynamic> json) =>
      _$$_SelectionItemFromJson(json);

  @override
  final String? key;
  @override
  final String? label;

  @override
  String toString() {
    return 'SelectionItem(key: $key, label: $label)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SelectionItem &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.label, label) || other.label == label));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, key, label);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SelectionItemCopyWith<_$_SelectionItem> get copyWith =>
      __$$_SelectionItemCopyWithImpl<_$_SelectionItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SelectionItemToJson(
      this,
    );
  }
}

abstract class _SelectionItem implements SelectionItem {
  const factory _SelectionItem({final String? key, final String? label}) =
      _$_SelectionItem;

  factory _SelectionItem.fromJson(Map<String, dynamic> json) =
      _$_SelectionItem.fromJson;

  @override
  String? get key;
  @override
  String? get label;
  @override
  @JsonKey(ignore: true)
  _$$_SelectionItemCopyWith<_$_SelectionItem> get copyWith =>
      throw _privateConstructorUsedError;
}
