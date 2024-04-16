// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mcu_connect.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

McuConnectResult _$McuConnectResultFromJson(Map<String, dynamic> json) {
  return _McuConnectResult.fromJson(json);
}

/// @nodoc
mixin _$McuConnectResult {
  String get deviceId => throw _privateConstructorUsedError;
  Vehicle? get vehicle => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $McuConnectResultCopyWith<McuConnectResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $McuConnectResultCopyWith<$Res> {
  factory $McuConnectResultCopyWith(
          McuConnectResult value, $Res Function(McuConnectResult) then) =
      _$McuConnectResultCopyWithImpl<$Res, McuConnectResult>;
  @useResult
  $Res call({String deviceId, Vehicle? vehicle});

  $VehicleCopyWith<$Res>? get vehicle;
}

/// @nodoc
class _$McuConnectResultCopyWithImpl<$Res, $Val extends McuConnectResult>
    implements $McuConnectResultCopyWith<$Res> {
  _$McuConnectResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? vehicle = freezed,
  }) {
    return _then(_value.copyWith(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      vehicle: freezed == vehicle
          ? _value.vehicle
          : vehicle // ignore: cast_nullable_to_non_nullable
              as Vehicle?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $VehicleCopyWith<$Res>? get vehicle {
    if (_value.vehicle == null) {
      return null;
    }

    return $VehicleCopyWith<$Res>(_value.vehicle!, (value) {
      return _then(_value.copyWith(vehicle: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_McuConnectResultCopyWith<$Res>
    implements $McuConnectResultCopyWith<$Res> {
  factory _$$_McuConnectResultCopyWith(
          _$_McuConnectResult value, $Res Function(_$_McuConnectResult) then) =
      __$$_McuConnectResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String deviceId, Vehicle? vehicle});

  @override
  $VehicleCopyWith<$Res>? get vehicle;
}

/// @nodoc
class __$$_McuConnectResultCopyWithImpl<$Res>
    extends _$McuConnectResultCopyWithImpl<$Res, _$_McuConnectResult>
    implements _$$_McuConnectResultCopyWith<$Res> {
  __$$_McuConnectResultCopyWithImpl(
      _$_McuConnectResult _value, $Res Function(_$_McuConnectResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? vehicle = freezed,
  }) {
    return _then(_$_McuConnectResult(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      vehicle: freezed == vehicle
          ? _value.vehicle
          : vehicle // ignore: cast_nullable_to_non_nullable
              as Vehicle?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_McuConnectResult implements _McuConnectResult {
  const _$_McuConnectResult({required this.deviceId, this.vehicle});

  factory _$_McuConnectResult.fromJson(Map<String, dynamic> json) =>
      _$$_McuConnectResultFromJson(json);

  @override
  final String deviceId;
  @override
  final Vehicle? vehicle;

  @override
  String toString() {
    return 'McuConnectResult(deviceId: $deviceId, vehicle: $vehicle)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_McuConnectResult &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.vehicle, vehicle) || other.vehicle == vehicle));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, deviceId, vehicle);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_McuConnectResultCopyWith<_$_McuConnectResult> get copyWith =>
      __$$_McuConnectResultCopyWithImpl<_$_McuConnectResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_McuConnectResultToJson(
      this,
    );
  }
}

abstract class _McuConnectResult implements McuConnectResult {
  const factory _McuConnectResult(
      {required final String deviceId,
      final Vehicle? vehicle}) = _$_McuConnectResult;

  factory _McuConnectResult.fromJson(Map<String, dynamic> json) =
      _$_McuConnectResult.fromJson;

  @override
  String get deviceId;
  @override
  Vehicle? get vehicle;
  @override
  @JsonKey(ignore: true)
  _$$_McuConnectResultCopyWith<_$_McuConnectResult> get copyWith =>
      throw _privateConstructorUsedError;
}

Vehicle _$VehicleFromJson(Map<String, dynamic> json) {
  return _Vehicle.fromJson(json);
}

/// @nodoc
mixin _$Vehicle {
  String get id => throw _privateConstructorUsedError;
  String? get vehicleModelId => throw _privateConstructorUsedError;
  VehicleModel? get vehicleModel => throw _privateConstructorUsedError;
  String? get model => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get registrationNumber => throw _privateConstructorUsedError;
  String? get color => throw _privateConstructorUsedError;
  int? get year => throw _privateConstructorUsedError;
  String? get purchaseDate => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  bool? get rowActive => throw _privateConstructorUsedError;
  String? get creatorUserId => throw _privateConstructorUsedError;
  PrimaryPicture? get primaryPicture => throw _privateConstructorUsedError;
  CreatorUser? get creatorUser => throw _privateConstructorUsedError;
  String? get physicalNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VehicleCopyWith<Vehicle> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleCopyWith<$Res> {
  factory $VehicleCopyWith(Vehicle value, $Res Function(Vehicle) then) =
      _$VehicleCopyWithImpl<$Res, Vehicle>;
  @useResult
  $Res call(
      {String id,
      String? vehicleModelId,
      VehicleModel? vehicleModel,
      String? model,
      String name,
      String? description,
      String? registrationNumber,
      String? color,
      int? year,
      String? purchaseDate,
      DateTime? createdAt,
      DateTime? updatedAt,
      bool? rowActive,
      String? creatorUserId,
      PrimaryPicture? primaryPicture,
      CreatorUser? creatorUser,
      String? physicalNumber});

  $VehicleModelCopyWith<$Res>? get vehicleModel;
  $PrimaryPictureCopyWith<$Res>? get primaryPicture;
  $CreatorUserCopyWith<$Res>? get creatorUser;
}

/// @nodoc
class _$VehicleCopyWithImpl<$Res, $Val extends Vehicle>
    implements $VehicleCopyWith<$Res> {
  _$VehicleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? vehicleModelId = freezed,
    Object? vehicleModel = freezed,
    Object? model = freezed,
    Object? name = null,
    Object? description = freezed,
    Object? registrationNumber = freezed,
    Object? color = freezed,
    Object? year = freezed,
    Object? purchaseDate = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? rowActive = freezed,
    Object? creatorUserId = freezed,
    Object? primaryPicture = freezed,
    Object? creatorUser = freezed,
    Object? physicalNumber = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleModelId: freezed == vehicleModelId
          ? _value.vehicleModelId
          : vehicleModelId // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicleModel: freezed == vehicleModel
          ? _value.vehicleModel
          : vehicleModel // ignore: cast_nullable_to_non_nullable
              as VehicleModel?,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      registrationNumber: freezed == registrationNumber
          ? _value.registrationNumber
          : registrationNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      purchaseDate: freezed == purchaseDate
          ? _value.purchaseDate
          : purchaseDate // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rowActive: freezed == rowActive
          ? _value.rowActive
          : rowActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      creatorUserId: freezed == creatorUserId
          ? _value.creatorUserId
          : creatorUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      primaryPicture: freezed == primaryPicture
          ? _value.primaryPicture
          : primaryPicture // ignore: cast_nullable_to_non_nullable
              as PrimaryPicture?,
      creatorUser: freezed == creatorUser
          ? _value.creatorUser
          : creatorUser // ignore: cast_nullable_to_non_nullable
              as CreatorUser?,
      physicalNumber: freezed == physicalNumber
          ? _value.physicalNumber
          : physicalNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $VehicleModelCopyWith<$Res>? get vehicleModel {
    if (_value.vehicleModel == null) {
      return null;
    }

    return $VehicleModelCopyWith<$Res>(_value.vehicleModel!, (value) {
      return _then(_value.copyWith(vehicleModel: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PrimaryPictureCopyWith<$Res>? get primaryPicture {
    if (_value.primaryPicture == null) {
      return null;
    }

    return $PrimaryPictureCopyWith<$Res>(_value.primaryPicture!, (value) {
      return _then(_value.copyWith(primaryPicture: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CreatorUserCopyWith<$Res>? get creatorUser {
    if (_value.creatorUser == null) {
      return null;
    }

    return $CreatorUserCopyWith<$Res>(_value.creatorUser!, (value) {
      return _then(_value.copyWith(creatorUser: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_VehicleCopyWith<$Res> implements $VehicleCopyWith<$Res> {
  factory _$$_VehicleCopyWith(
          _$_Vehicle value, $Res Function(_$_Vehicle) then) =
      __$$_VehicleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String? vehicleModelId,
      VehicleModel? vehicleModel,
      String? model,
      String name,
      String? description,
      String? registrationNumber,
      String? color,
      int? year,
      String? purchaseDate,
      DateTime? createdAt,
      DateTime? updatedAt,
      bool? rowActive,
      String? creatorUserId,
      PrimaryPicture? primaryPicture,
      CreatorUser? creatorUser,
      String? physicalNumber});

  @override
  $VehicleModelCopyWith<$Res>? get vehicleModel;
  @override
  $PrimaryPictureCopyWith<$Res>? get primaryPicture;
  @override
  $CreatorUserCopyWith<$Res>? get creatorUser;
}

/// @nodoc
class __$$_VehicleCopyWithImpl<$Res>
    extends _$VehicleCopyWithImpl<$Res, _$_Vehicle>
    implements _$$_VehicleCopyWith<$Res> {
  __$$_VehicleCopyWithImpl(_$_Vehicle _value, $Res Function(_$_Vehicle) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? vehicleModelId = freezed,
    Object? vehicleModel = freezed,
    Object? model = freezed,
    Object? name = null,
    Object? description = freezed,
    Object? registrationNumber = freezed,
    Object? color = freezed,
    Object? year = freezed,
    Object? purchaseDate = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? rowActive = freezed,
    Object? creatorUserId = freezed,
    Object? primaryPicture = freezed,
    Object? creatorUser = freezed,
    Object? physicalNumber = freezed,
  }) {
    return _then(_$_Vehicle(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleModelId: freezed == vehicleModelId
          ? _value.vehicleModelId
          : vehicleModelId // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicleModel: freezed == vehicleModel
          ? _value.vehicleModel
          : vehicleModel // ignore: cast_nullable_to_non_nullable
              as VehicleModel?,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      registrationNumber: freezed == registrationNumber
          ? _value.registrationNumber
          : registrationNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      purchaseDate: freezed == purchaseDate
          ? _value.purchaseDate
          : purchaseDate // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rowActive: freezed == rowActive
          ? _value.rowActive
          : rowActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      creatorUserId: freezed == creatorUserId
          ? _value.creatorUserId
          : creatorUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      primaryPicture: freezed == primaryPicture
          ? _value.primaryPicture
          : primaryPicture // ignore: cast_nullable_to_non_nullable
              as PrimaryPicture?,
      creatorUser: freezed == creatorUser
          ? _value.creatorUser
          : creatorUser // ignore: cast_nullable_to_non_nullable
              as CreatorUser?,
      physicalNumber: freezed == physicalNumber
          ? _value.physicalNumber
          : physicalNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Vehicle implements _Vehicle {
  const _$_Vehicle(
      {required this.id,
      this.vehicleModelId,
      this.vehicleModel,
      this.model,
      required this.name,
      this.description,
      this.registrationNumber,
      this.color,
      this.year,
      this.purchaseDate,
      this.createdAt,
      this.updatedAt,
      this.rowActive,
      this.creatorUserId,
      this.primaryPicture,
      this.creatorUser,
      this.physicalNumber});

  factory _$_Vehicle.fromJson(Map<String, dynamic> json) =>
      _$$_VehicleFromJson(json);

  @override
  final String id;
  @override
  final String? vehicleModelId;
  @override
  final VehicleModel? vehicleModel;
  @override
  final String? model;
  @override
  final String name;
  @override
  final String? description;
  @override
  final String? registrationNumber;
  @override
  final String? color;
  @override
  final int? year;
  @override
  final String? purchaseDate;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final bool? rowActive;
  @override
  final String? creatorUserId;
  @override
  final PrimaryPicture? primaryPicture;
  @override
  final CreatorUser? creatorUser;
  @override
  final String? physicalNumber;

  @override
  String toString() {
    return 'Vehicle(id: $id, vehicleModelId: $vehicleModelId, vehicleModel: $vehicleModel, model: $model, name: $name, description: $description, registrationNumber: $registrationNumber, color: $color, year: $year, purchaseDate: $purchaseDate, createdAt: $createdAt, updatedAt: $updatedAt, rowActive: $rowActive, creatorUserId: $creatorUserId, primaryPicture: $primaryPicture, creatorUser: $creatorUser, physicalNumber: $physicalNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Vehicle &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.vehicleModelId, vehicleModelId) ||
                other.vehicleModelId == vehicleModelId) &&
            (identical(other.vehicleModel, vehicleModel) ||
                other.vehicleModel == vehicleModel) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.registrationNumber, registrationNumber) ||
                other.registrationNumber == registrationNumber) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.purchaseDate, purchaseDate) ||
                other.purchaseDate == purchaseDate) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.rowActive, rowActive) ||
                other.rowActive == rowActive) &&
            (identical(other.creatorUserId, creatorUserId) ||
                other.creatorUserId == creatorUserId) &&
            (identical(other.primaryPicture, primaryPicture) ||
                other.primaryPicture == primaryPicture) &&
            (identical(other.creatorUser, creatorUser) ||
                other.creatorUser == creatorUser) &&
            (identical(other.physicalNumber, physicalNumber) ||
                other.physicalNumber == physicalNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      vehicleModelId,
      vehicleModel,
      model,
      name,
      description,
      registrationNumber,
      color,
      year,
      purchaseDate,
      createdAt,
      updatedAt,
      rowActive,
      creatorUserId,
      primaryPicture,
      creatorUser,
      physicalNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VehicleCopyWith<_$_Vehicle> get copyWith =>
      __$$_VehicleCopyWithImpl<_$_Vehicle>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VehicleToJson(
      this,
    );
  }
}

abstract class _Vehicle implements Vehicle {
  const factory _Vehicle(
      {required final String id,
      final String? vehicleModelId,
      final VehicleModel? vehicleModel,
      final String? model,
      required final String name,
      final String? description,
      final String? registrationNumber,
      final String? color,
      final int? year,
      final String? purchaseDate,
      final DateTime? createdAt,
      final DateTime? updatedAt,
      final bool? rowActive,
      final String? creatorUserId,
      final PrimaryPicture? primaryPicture,
      final CreatorUser? creatorUser,
      final String? physicalNumber}) = _$_Vehicle;

  factory _Vehicle.fromJson(Map<String, dynamic> json) = _$_Vehicle.fromJson;

  @override
  String get id;
  @override
  String? get vehicleModelId;
  @override
  VehicleModel? get vehicleModel;
  @override
  String? get model;
  @override
  String get name;
  @override
  String? get description;
  @override
  String? get registrationNumber;
  @override
  String? get color;
  @override
  int? get year;
  @override
  String? get purchaseDate;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  bool? get rowActive;
  @override
  String? get creatorUserId;
  @override
  PrimaryPicture? get primaryPicture;
  @override
  CreatorUser? get creatorUser;
  @override
  String? get physicalNumber;
  @override
  @JsonKey(ignore: true)
  _$$_VehicleCopyWith<_$_Vehicle> get copyWith =>
      throw _privateConstructorUsedError;
}

PrimaryPicture _$PrimaryPictureFromJson(Map<String, dynamic> json) {
  return _PrimaryPicture.fromJson(json);
}

/// @nodoc
mixin _$PrimaryPicture {
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PrimaryPictureCopyWith<PrimaryPicture> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrimaryPictureCopyWith<$Res> {
  factory $PrimaryPictureCopyWith(
          PrimaryPicture value, $Res Function(PrimaryPicture) then) =
      _$PrimaryPictureCopyWithImpl<$Res, PrimaryPicture>;
  @useResult
  $Res call({String url});
}

/// @nodoc
class _$PrimaryPictureCopyWithImpl<$Res, $Val extends PrimaryPicture>
    implements $PrimaryPictureCopyWith<$Res> {
  _$PrimaryPictureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PrimaryPictureCopyWith<$Res>
    implements $PrimaryPictureCopyWith<$Res> {
  factory _$$_PrimaryPictureCopyWith(
          _$_PrimaryPicture value, $Res Function(_$_PrimaryPicture) then) =
      __$$_PrimaryPictureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String url});
}

/// @nodoc
class __$$_PrimaryPictureCopyWithImpl<$Res>
    extends _$PrimaryPictureCopyWithImpl<$Res, _$_PrimaryPicture>
    implements _$$_PrimaryPictureCopyWith<$Res> {
  __$$_PrimaryPictureCopyWithImpl(
      _$_PrimaryPicture _value, $Res Function(_$_PrimaryPicture) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_$_PrimaryPicture(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PrimaryPicture implements _PrimaryPicture {
  const _$_PrimaryPicture({required this.url});

  factory _$_PrimaryPicture.fromJson(Map<String, dynamic> json) =>
      _$$_PrimaryPictureFromJson(json);

  @override
  final String url;

  @override
  String toString() {
    return 'PrimaryPicture(url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PrimaryPicture &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PrimaryPictureCopyWith<_$_PrimaryPicture> get copyWith =>
      __$$_PrimaryPictureCopyWithImpl<_$_PrimaryPicture>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PrimaryPictureToJson(
      this,
    );
  }
}

abstract class _PrimaryPicture implements PrimaryPicture {
  const factory _PrimaryPicture({required final String url}) =
      _$_PrimaryPicture;

  factory _PrimaryPicture.fromJson(Map<String, dynamic> json) =
      _$_PrimaryPicture.fromJson;

  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$_PrimaryPictureCopyWith<_$_PrimaryPicture> get copyWith =>
      throw _privateConstructorUsedError;
}

CreatorUser _$CreatorUserFromJson(Map<String, dynamic> json) {
  return _CreatorUser.fromJson(json);
}

/// @nodoc
mixin _$CreatorUser {
  String get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  bool? get rowActive => throw _privateConstructorUsedError;
  String? get mobilePhoneNumber => throw _privateConstructorUsedError;
  String? get mobilePhoneCountry => throw _privateConstructorUsedError;
  String? get profilePictureAssetId => throw _privateConstructorUsedError;
  ProfilePictureAsset? get profilePictureAsset =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreatorUserCopyWith<CreatorUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatorUserCopyWith<$Res> {
  factory $CreatorUserCopyWith(
          CreatorUser value, $Res Function(CreatorUser) then) =
      _$CreatorUserCopyWithImpl<$Res, CreatorUser>;
  @useResult
  $Res call(
      {String id,
      String? name,
      String? username,
      String? email,
      DateTime? createdAt,
      DateTime? updatedAt,
      bool? rowActive,
      String? mobilePhoneNumber,
      String? mobilePhoneCountry,
      String? profilePictureAssetId,
      ProfilePictureAsset? profilePictureAsset});

  $ProfilePictureAssetCopyWith<$Res>? get profilePictureAsset;
}

/// @nodoc
class _$CreatorUserCopyWithImpl<$Res, $Val extends CreatorUser>
    implements $CreatorUserCopyWith<$Res> {
  _$CreatorUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? username = freezed,
    Object? email = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? rowActive = freezed,
    Object? mobilePhoneNumber = freezed,
    Object? mobilePhoneCountry = freezed,
    Object? profilePictureAssetId = freezed,
    Object? profilePictureAsset = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rowActive: freezed == rowActive
          ? _value.rowActive
          : rowActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      mobilePhoneNumber: freezed == mobilePhoneNumber
          ? _value.mobilePhoneNumber
          : mobilePhoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      mobilePhoneCountry: freezed == mobilePhoneCountry
          ? _value.mobilePhoneCountry
          : mobilePhoneCountry // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePictureAssetId: freezed == profilePictureAssetId
          ? _value.profilePictureAssetId
          : profilePictureAssetId // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePictureAsset: freezed == profilePictureAsset
          ? _value.profilePictureAsset
          : profilePictureAsset // ignore: cast_nullable_to_non_nullable
              as ProfilePictureAsset?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfilePictureAssetCopyWith<$Res>? get profilePictureAsset {
    if (_value.profilePictureAsset == null) {
      return null;
    }

    return $ProfilePictureAssetCopyWith<$Res>(_value.profilePictureAsset!,
        (value) {
      return _then(_value.copyWith(profilePictureAsset: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CreatorUserCopyWith<$Res>
    implements $CreatorUserCopyWith<$Res> {
  factory _$$_CreatorUserCopyWith(
          _$_CreatorUser value, $Res Function(_$_CreatorUser) then) =
      __$$_CreatorUserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String? name,
      String? username,
      String? email,
      DateTime? createdAt,
      DateTime? updatedAt,
      bool? rowActive,
      String? mobilePhoneNumber,
      String? mobilePhoneCountry,
      String? profilePictureAssetId,
      ProfilePictureAsset? profilePictureAsset});

  @override
  $ProfilePictureAssetCopyWith<$Res>? get profilePictureAsset;
}

/// @nodoc
class __$$_CreatorUserCopyWithImpl<$Res>
    extends _$CreatorUserCopyWithImpl<$Res, _$_CreatorUser>
    implements _$$_CreatorUserCopyWith<$Res> {
  __$$_CreatorUserCopyWithImpl(
      _$_CreatorUser _value, $Res Function(_$_CreatorUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? username = freezed,
    Object? email = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? rowActive = freezed,
    Object? mobilePhoneNumber = freezed,
    Object? mobilePhoneCountry = freezed,
    Object? profilePictureAssetId = freezed,
    Object? profilePictureAsset = freezed,
  }) {
    return _then(_$_CreatorUser(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rowActive: freezed == rowActive
          ? _value.rowActive
          : rowActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      mobilePhoneNumber: freezed == mobilePhoneNumber
          ? _value.mobilePhoneNumber
          : mobilePhoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      mobilePhoneCountry: freezed == mobilePhoneCountry
          ? _value.mobilePhoneCountry
          : mobilePhoneCountry // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePictureAssetId: freezed == profilePictureAssetId
          ? _value.profilePictureAssetId
          : profilePictureAssetId // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePictureAsset: freezed == profilePictureAsset
          ? _value.profilePictureAsset
          : profilePictureAsset // ignore: cast_nullable_to_non_nullable
              as ProfilePictureAsset?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CreatorUser implements _CreatorUser {
  const _$_CreatorUser(
      {required this.id,
      this.name,
      this.username,
      this.email,
      this.createdAt,
      this.updatedAt,
      this.rowActive,
      this.mobilePhoneNumber,
      this.mobilePhoneCountry,
      this.profilePictureAssetId,
      this.profilePictureAsset});

  factory _$_CreatorUser.fromJson(Map<String, dynamic> json) =>
      _$$_CreatorUserFromJson(json);

  @override
  final String id;
  @override
  final String? name;
  @override
  final String? username;
  @override
  final String? email;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final bool? rowActive;
  @override
  final String? mobilePhoneNumber;
  @override
  final String? mobilePhoneCountry;
  @override
  final String? profilePictureAssetId;
  @override
  final ProfilePictureAsset? profilePictureAsset;

  @override
  String toString() {
    return 'CreatorUser(id: $id, name: $name, username: $username, email: $email, createdAt: $createdAt, updatedAt: $updatedAt, rowActive: $rowActive, mobilePhoneNumber: $mobilePhoneNumber, mobilePhoneCountry: $mobilePhoneCountry, profilePictureAssetId: $profilePictureAssetId, profilePictureAsset: $profilePictureAsset)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreatorUser &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.rowActive, rowActive) ||
                other.rowActive == rowActive) &&
            (identical(other.mobilePhoneNumber, mobilePhoneNumber) ||
                other.mobilePhoneNumber == mobilePhoneNumber) &&
            (identical(other.mobilePhoneCountry, mobilePhoneCountry) ||
                other.mobilePhoneCountry == mobilePhoneCountry) &&
            (identical(other.profilePictureAssetId, profilePictureAssetId) ||
                other.profilePictureAssetId == profilePictureAssetId) &&
            (identical(other.profilePictureAsset, profilePictureAsset) ||
                other.profilePictureAsset == profilePictureAsset));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      username,
      email,
      createdAt,
      updatedAt,
      rowActive,
      mobilePhoneNumber,
      mobilePhoneCountry,
      profilePictureAssetId,
      profilePictureAsset);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreatorUserCopyWith<_$_CreatorUser> get copyWith =>
      __$$_CreatorUserCopyWithImpl<_$_CreatorUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CreatorUserToJson(
      this,
    );
  }
}

abstract class _CreatorUser implements CreatorUser {
  const factory _CreatorUser(
      {required final String id,
      final String? name,
      final String? username,
      final String? email,
      final DateTime? createdAt,
      final DateTime? updatedAt,
      final bool? rowActive,
      final String? mobilePhoneNumber,
      final String? mobilePhoneCountry,
      final String? profilePictureAssetId,
      final ProfilePictureAsset? profilePictureAsset}) = _$_CreatorUser;

  factory _CreatorUser.fromJson(Map<String, dynamic> json) =
      _$_CreatorUser.fromJson;

  @override
  String get id;
  @override
  String? get name;
  @override
  String? get username;
  @override
  String? get email;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  bool? get rowActive;
  @override
  String? get mobilePhoneNumber;
  @override
  String? get mobilePhoneCountry;
  @override
  String? get profilePictureAssetId;
  @override
  ProfilePictureAsset? get profilePictureAsset;
  @override
  @JsonKey(ignore: true)
  _$$_CreatorUserCopyWith<_$_CreatorUser> get copyWith =>
      throw _privateConstructorUsedError;
}

ProfilePictureAsset _$ProfilePictureAssetFromJson(Map<String, dynamic> json) {
  return _ProfilePictureAsset.fromJson(json);
}

/// @nodoc
mixin _$ProfilePictureAsset {
  String? get id => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get applicationId => throw _privateConstructorUsedError;
  ApplicationData? get application => throw _privateConstructorUsedError;
  String? get assetTypeId => throw _privateConstructorUsedError;
  AssetType? get assetType => throw _privateConstructorUsedError;
  String? get fileSourceId => throw _privateConstructorUsedError;
  FileSource? get fileSource => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  bool? get rowActive => throw _privateConstructorUsedError;
  String? get path => throw _privateConstructorUsedError;
  bool? get protected => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get byteLength => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfilePictureAssetCopyWith<ProfilePictureAsset> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfilePictureAssetCopyWith<$Res> {
  factory $ProfilePictureAssetCopyWith(
          ProfilePictureAsset value, $Res Function(ProfilePictureAsset) then) =
      _$ProfilePictureAssetCopyWithImpl<$Res, ProfilePictureAsset>;
  @useResult
  $Res call(
      {String? id,
      String? description,
      String? applicationId,
      ApplicationData? application,
      String? assetTypeId,
      AssetType? assetType,
      String? fileSourceId,
      FileSource? fileSource,
      DateTime? createdAt,
      DateTime? updatedAt,
      bool? rowActive,
      String? path,
      bool? protected,
      String? name,
      String? byteLength});

  $ApplicationDataCopyWith<$Res>? get application;
  $AssetTypeCopyWith<$Res>? get assetType;
  $FileSourceCopyWith<$Res>? get fileSource;
}

/// @nodoc
class _$ProfilePictureAssetCopyWithImpl<$Res, $Val extends ProfilePictureAsset>
    implements $ProfilePictureAssetCopyWith<$Res> {
  _$ProfilePictureAssetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? description = freezed,
    Object? applicationId = freezed,
    Object? application = freezed,
    Object? assetTypeId = freezed,
    Object? assetType = freezed,
    Object? fileSourceId = freezed,
    Object? fileSource = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? rowActive = freezed,
    Object? path = freezed,
    Object? protected = freezed,
    Object? name = freezed,
    Object? byteLength = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      applicationId: freezed == applicationId
          ? _value.applicationId
          : applicationId // ignore: cast_nullable_to_non_nullable
              as String?,
      application: freezed == application
          ? _value.application
          : application // ignore: cast_nullable_to_non_nullable
              as ApplicationData?,
      assetTypeId: freezed == assetTypeId
          ? _value.assetTypeId
          : assetTypeId // ignore: cast_nullable_to_non_nullable
              as String?,
      assetType: freezed == assetType
          ? _value.assetType
          : assetType // ignore: cast_nullable_to_non_nullable
              as AssetType?,
      fileSourceId: freezed == fileSourceId
          ? _value.fileSourceId
          : fileSourceId // ignore: cast_nullable_to_non_nullable
              as String?,
      fileSource: freezed == fileSource
          ? _value.fileSource
          : fileSource // ignore: cast_nullable_to_non_nullable
              as FileSource?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rowActive: freezed == rowActive
          ? _value.rowActive
          : rowActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      path: freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
      protected: freezed == protected
          ? _value.protected
          : protected // ignore: cast_nullable_to_non_nullable
              as bool?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      byteLength: freezed == byteLength
          ? _value.byteLength
          : byteLength // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ApplicationDataCopyWith<$Res>? get application {
    if (_value.application == null) {
      return null;
    }

    return $ApplicationDataCopyWith<$Res>(_value.application!, (value) {
      return _then(_value.copyWith(application: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AssetTypeCopyWith<$Res>? get assetType {
    if (_value.assetType == null) {
      return null;
    }

    return $AssetTypeCopyWith<$Res>(_value.assetType!, (value) {
      return _then(_value.copyWith(assetType: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FileSourceCopyWith<$Res>? get fileSource {
    if (_value.fileSource == null) {
      return null;
    }

    return $FileSourceCopyWith<$Res>(_value.fileSource!, (value) {
      return _then(_value.copyWith(fileSource: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ProfilePictureAssetCopyWith<$Res>
    implements $ProfilePictureAssetCopyWith<$Res> {
  factory _$$_ProfilePictureAssetCopyWith(_$_ProfilePictureAsset value,
          $Res Function(_$_ProfilePictureAsset) then) =
      __$$_ProfilePictureAssetCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? description,
      String? applicationId,
      ApplicationData? application,
      String? assetTypeId,
      AssetType? assetType,
      String? fileSourceId,
      FileSource? fileSource,
      DateTime? createdAt,
      DateTime? updatedAt,
      bool? rowActive,
      String? path,
      bool? protected,
      String? name,
      String? byteLength});

  @override
  $ApplicationDataCopyWith<$Res>? get application;
  @override
  $AssetTypeCopyWith<$Res>? get assetType;
  @override
  $FileSourceCopyWith<$Res>? get fileSource;
}

/// @nodoc
class __$$_ProfilePictureAssetCopyWithImpl<$Res>
    extends _$ProfilePictureAssetCopyWithImpl<$Res, _$_ProfilePictureAsset>
    implements _$$_ProfilePictureAssetCopyWith<$Res> {
  __$$_ProfilePictureAssetCopyWithImpl(_$_ProfilePictureAsset _value,
      $Res Function(_$_ProfilePictureAsset) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? description = freezed,
    Object? applicationId = freezed,
    Object? application = freezed,
    Object? assetTypeId = freezed,
    Object? assetType = freezed,
    Object? fileSourceId = freezed,
    Object? fileSource = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? rowActive = freezed,
    Object? path = freezed,
    Object? protected = freezed,
    Object? name = freezed,
    Object? byteLength = freezed,
  }) {
    return _then(_$_ProfilePictureAsset(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      applicationId: freezed == applicationId
          ? _value.applicationId
          : applicationId // ignore: cast_nullable_to_non_nullable
              as String?,
      application: freezed == application
          ? _value.application
          : application // ignore: cast_nullable_to_non_nullable
              as ApplicationData?,
      assetTypeId: freezed == assetTypeId
          ? _value.assetTypeId
          : assetTypeId // ignore: cast_nullable_to_non_nullable
              as String?,
      assetType: freezed == assetType
          ? _value.assetType
          : assetType // ignore: cast_nullable_to_non_nullable
              as AssetType?,
      fileSourceId: freezed == fileSourceId
          ? _value.fileSourceId
          : fileSourceId // ignore: cast_nullable_to_non_nullable
              as String?,
      fileSource: freezed == fileSource
          ? _value.fileSource
          : fileSource // ignore: cast_nullable_to_non_nullable
              as FileSource?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rowActive: freezed == rowActive
          ? _value.rowActive
          : rowActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      path: freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
      protected: freezed == protected
          ? _value.protected
          : protected // ignore: cast_nullable_to_non_nullable
              as bool?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      byteLength: freezed == byteLength
          ? _value.byteLength
          : byteLength // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProfilePictureAsset implements _ProfilePictureAsset {
  const _$_ProfilePictureAsset(
      {this.id,
      this.description,
      this.applicationId,
      this.application,
      this.assetTypeId,
      this.assetType,
      this.fileSourceId,
      this.fileSource,
      this.createdAt,
      this.updatedAt,
      this.rowActive,
      this.path,
      this.protected,
      this.name,
      this.byteLength});

  factory _$_ProfilePictureAsset.fromJson(Map<String, dynamic> json) =>
      _$$_ProfilePictureAssetFromJson(json);

  @override
  final String? id;
  @override
  final String? description;
  @override
  final String? applicationId;
  @override
  final ApplicationData? application;
  @override
  final String? assetTypeId;
  @override
  final AssetType? assetType;
  @override
  final String? fileSourceId;
  @override
  final FileSource? fileSource;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final bool? rowActive;
  @override
  final String? path;
  @override
  final bool? protected;
  @override
  final String? name;
  @override
  final String? byteLength;

  @override
  String toString() {
    return 'ProfilePictureAsset(id: $id, description: $description, applicationId: $applicationId, application: $application, assetTypeId: $assetTypeId, assetType: $assetType, fileSourceId: $fileSourceId, fileSource: $fileSource, createdAt: $createdAt, updatedAt: $updatedAt, rowActive: $rowActive, path: $path, protected: $protected, name: $name, byteLength: $byteLength)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProfilePictureAsset &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.applicationId, applicationId) ||
                other.applicationId == applicationId) &&
            (identical(other.application, application) ||
                other.application == application) &&
            (identical(other.assetTypeId, assetTypeId) ||
                other.assetTypeId == assetTypeId) &&
            (identical(other.assetType, assetType) ||
                other.assetType == assetType) &&
            (identical(other.fileSourceId, fileSourceId) ||
                other.fileSourceId == fileSourceId) &&
            (identical(other.fileSource, fileSource) ||
                other.fileSource == fileSource) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.rowActive, rowActive) ||
                other.rowActive == rowActive) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.protected, protected) ||
                other.protected == protected) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.byteLength, byteLength) ||
                other.byteLength == byteLength));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      description,
      applicationId,
      application,
      assetTypeId,
      assetType,
      fileSourceId,
      fileSource,
      createdAt,
      updatedAt,
      rowActive,
      path,
      protected,
      name,
      byteLength);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProfilePictureAssetCopyWith<_$_ProfilePictureAsset> get copyWith =>
      __$$_ProfilePictureAssetCopyWithImpl<_$_ProfilePictureAsset>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProfilePictureAssetToJson(
      this,
    );
  }
}

abstract class _ProfilePictureAsset implements ProfilePictureAsset {
  const factory _ProfilePictureAsset(
      {final String? id,
      final String? description,
      final String? applicationId,
      final ApplicationData? application,
      final String? assetTypeId,
      final AssetType? assetType,
      final String? fileSourceId,
      final FileSource? fileSource,
      final DateTime? createdAt,
      final DateTime? updatedAt,
      final bool? rowActive,
      final String? path,
      final bool? protected,
      final String? name,
      final String? byteLength}) = _$_ProfilePictureAsset;

  factory _ProfilePictureAsset.fromJson(Map<String, dynamic> json) =
      _$_ProfilePictureAsset.fromJson;

  @override
  String? get id;
  @override
  String? get description;
  @override
  String? get applicationId;
  @override
  ApplicationData? get application;
  @override
  String? get assetTypeId;
  @override
  AssetType? get assetType;
  @override
  String? get fileSourceId;
  @override
  FileSource? get fileSource;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  bool? get rowActive;
  @override
  String? get path;
  @override
  bool? get protected;
  @override
  String? get name;
  @override
  String? get byteLength;
  @override
  @JsonKey(ignore: true)
  _$$_ProfilePictureAssetCopyWith<_$_ProfilePictureAsset> get copyWith =>
      throw _privateConstructorUsedError;
}

ApplicationData _$ApplicationDataFromJson(Map<String, dynamic> json) {
  return _ApplicationData.fromJson(json);
}

/// @nodoc
mixin _$ApplicationData {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get packageName => throw _privateConstructorUsedError;
  String? get domain => throw _privateConstructorUsedError;
  String? get organizationId => throw _privateConstructorUsedError;
  Organization? get organization => throw _privateConstructorUsedError;
  String? get applicationGroupId => throw _privateConstructorUsedError;
  VehicleType? get applicationGroup => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  bool? get rowActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApplicationDataCopyWith<ApplicationData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApplicationDataCopyWith<$Res> {
  factory $ApplicationDataCopyWith(
          ApplicationData value, $Res Function(ApplicationData) then) =
      _$ApplicationDataCopyWithImpl<$Res, ApplicationData>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? packageName,
      String? domain,
      String? organizationId,
      Organization? organization,
      String? applicationGroupId,
      VehicleType? applicationGroup,
      DateTime? createdAt,
      DateTime? updatedAt,
      bool? rowActive});

  $OrganizationCopyWith<$Res>? get organization;
  $VehicleTypeCopyWith<$Res>? get applicationGroup;
}

/// @nodoc
class _$ApplicationDataCopyWithImpl<$Res, $Val extends ApplicationData>
    implements $ApplicationDataCopyWith<$Res> {
  _$ApplicationDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? packageName = freezed,
    Object? domain = freezed,
    Object? organizationId = freezed,
    Object? organization = freezed,
    Object? applicationGroupId = freezed,
    Object? applicationGroup = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? rowActive = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      packageName: freezed == packageName
          ? _value.packageName
          : packageName // ignore: cast_nullable_to_non_nullable
              as String?,
      domain: freezed == domain
          ? _value.domain
          : domain // ignore: cast_nullable_to_non_nullable
              as String?,
      organizationId: freezed == organizationId
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as String?,
      organization: freezed == organization
          ? _value.organization
          : organization // ignore: cast_nullable_to_non_nullable
              as Organization?,
      applicationGroupId: freezed == applicationGroupId
          ? _value.applicationGroupId
          : applicationGroupId // ignore: cast_nullable_to_non_nullable
              as String?,
      applicationGroup: freezed == applicationGroup
          ? _value.applicationGroup
          : applicationGroup // ignore: cast_nullable_to_non_nullable
              as VehicleType?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rowActive: freezed == rowActive
          ? _value.rowActive
          : rowActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OrganizationCopyWith<$Res>? get organization {
    if (_value.organization == null) {
      return null;
    }

    return $OrganizationCopyWith<$Res>(_value.organization!, (value) {
      return _then(_value.copyWith(organization: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $VehicleTypeCopyWith<$Res>? get applicationGroup {
    if (_value.applicationGroup == null) {
      return null;
    }

    return $VehicleTypeCopyWith<$Res>(_value.applicationGroup!, (value) {
      return _then(_value.copyWith(applicationGroup: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ApplicationDataCopyWith<$Res>
    implements $ApplicationDataCopyWith<$Res> {
  factory _$$_ApplicationDataCopyWith(
          _$_ApplicationData value, $Res Function(_$_ApplicationData) then) =
      __$$_ApplicationDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? packageName,
      String? domain,
      String? organizationId,
      Organization? organization,
      String? applicationGroupId,
      VehicleType? applicationGroup,
      DateTime? createdAt,
      DateTime? updatedAt,
      bool? rowActive});

  @override
  $OrganizationCopyWith<$Res>? get organization;
  @override
  $VehicleTypeCopyWith<$Res>? get applicationGroup;
}

/// @nodoc
class __$$_ApplicationDataCopyWithImpl<$Res>
    extends _$ApplicationDataCopyWithImpl<$Res, _$_ApplicationData>
    implements _$$_ApplicationDataCopyWith<$Res> {
  __$$_ApplicationDataCopyWithImpl(
      _$_ApplicationData _value, $Res Function(_$_ApplicationData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? packageName = freezed,
    Object? domain = freezed,
    Object? organizationId = freezed,
    Object? organization = freezed,
    Object? applicationGroupId = freezed,
    Object? applicationGroup = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? rowActive = freezed,
  }) {
    return _then(_$_ApplicationData(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      packageName: freezed == packageName
          ? _value.packageName
          : packageName // ignore: cast_nullable_to_non_nullable
              as String?,
      domain: freezed == domain
          ? _value.domain
          : domain // ignore: cast_nullable_to_non_nullable
              as String?,
      organizationId: freezed == organizationId
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as String?,
      organization: freezed == organization
          ? _value.organization
          : organization // ignore: cast_nullable_to_non_nullable
              as Organization?,
      applicationGroupId: freezed == applicationGroupId
          ? _value.applicationGroupId
          : applicationGroupId // ignore: cast_nullable_to_non_nullable
              as String?,
      applicationGroup: freezed == applicationGroup
          ? _value.applicationGroup
          : applicationGroup // ignore: cast_nullable_to_non_nullable
              as VehicleType?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rowActive: freezed == rowActive
          ? _value.rowActive
          : rowActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ApplicationData implements _ApplicationData {
  const _$_ApplicationData(
      {this.id,
      this.name,
      this.packageName,
      this.domain,
      this.organizationId,
      this.organization,
      this.applicationGroupId,
      this.applicationGroup,
      this.createdAt,
      this.updatedAt,
      this.rowActive});

  factory _$_ApplicationData.fromJson(Map<String, dynamic> json) =>
      _$$_ApplicationDataFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? packageName;
  @override
  final String? domain;
  @override
  final String? organizationId;
  @override
  final Organization? organization;
  @override
  final String? applicationGroupId;
  @override
  final VehicleType? applicationGroup;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final bool? rowActive;

  @override
  String toString() {
    return 'ApplicationData(id: $id, name: $name, packageName: $packageName, domain: $domain, organizationId: $organizationId, organization: $organization, applicationGroupId: $applicationGroupId, applicationGroup: $applicationGroup, createdAt: $createdAt, updatedAt: $updatedAt, rowActive: $rowActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ApplicationData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.packageName, packageName) ||
                other.packageName == packageName) &&
            (identical(other.domain, domain) || other.domain == domain) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.organization, organization) ||
                other.organization == organization) &&
            (identical(other.applicationGroupId, applicationGroupId) ||
                other.applicationGroupId == applicationGroupId) &&
            (identical(other.applicationGroup, applicationGroup) ||
                other.applicationGroup == applicationGroup) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.rowActive, rowActive) ||
                other.rowActive == rowActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      packageName,
      domain,
      organizationId,
      organization,
      applicationGroupId,
      applicationGroup,
      createdAt,
      updatedAt,
      rowActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ApplicationDataCopyWith<_$_ApplicationData> get copyWith =>
      __$$_ApplicationDataCopyWithImpl<_$_ApplicationData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ApplicationDataToJson(
      this,
    );
  }
}

abstract class _ApplicationData implements ApplicationData {
  const factory _ApplicationData(
      {final String? id,
      final String? name,
      final String? packageName,
      final String? domain,
      final String? organizationId,
      final Organization? organization,
      final String? applicationGroupId,
      final VehicleType? applicationGroup,
      final DateTime? createdAt,
      final DateTime? updatedAt,
      final bool? rowActive}) = _$_ApplicationData;

  factory _ApplicationData.fromJson(Map<String, dynamic> json) =
      _$_ApplicationData.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get packageName;
  @override
  String? get domain;
  @override
  String? get organizationId;
  @override
  Organization? get organization;
  @override
  String? get applicationGroupId;
  @override
  VehicleType? get applicationGroup;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  bool? get rowActive;
  @override
  @JsonKey(ignore: true)
  _$$_ApplicationDataCopyWith<_$_ApplicationData> get copyWith =>
      throw _privateConstructorUsedError;
}

VehicleType _$VehicleTypeFromJson(Map<String, dynamic> json) {
  return _VehicleType.fromJson(json);
}

/// @nodoc
mixin _$VehicleType {
  String? get id => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  bool? get rowActive => throw _privateConstructorUsedError;
  String? get organizationId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VehicleTypeCopyWith<VehicleType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleTypeCopyWith<$Res> {
  factory $VehicleTypeCopyWith(
          VehicleType value, $Res Function(VehicleType) then) =
      _$VehicleTypeCopyWithImpl<$Res, VehicleType>;
  @useResult
  $Res call(
      {String? id,
      String? code,
      String? name,
      String? description,
      DateTime? createdAt,
      DateTime? updatedAt,
      bool? rowActive,
      String? organizationId});
}

/// @nodoc
class _$VehicleTypeCopyWithImpl<$Res, $Val extends VehicleType>
    implements $VehicleTypeCopyWith<$Res> {
  _$VehicleTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? rowActive = freezed,
    Object? organizationId = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rowActive: freezed == rowActive
          ? _value.rowActive
          : rowActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      organizationId: freezed == organizationId
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_VehicleTypeCopyWith<$Res>
    implements $VehicleTypeCopyWith<$Res> {
  factory _$$_VehicleTypeCopyWith(
          _$_VehicleType value, $Res Function(_$_VehicleType) then) =
      __$$_VehicleTypeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? code,
      String? name,
      String? description,
      DateTime? createdAt,
      DateTime? updatedAt,
      bool? rowActive,
      String? organizationId});
}

/// @nodoc
class __$$_VehicleTypeCopyWithImpl<$Res>
    extends _$VehicleTypeCopyWithImpl<$Res, _$_VehicleType>
    implements _$$_VehicleTypeCopyWith<$Res> {
  __$$_VehicleTypeCopyWithImpl(
      _$_VehicleType _value, $Res Function(_$_VehicleType) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? rowActive = freezed,
    Object? organizationId = freezed,
  }) {
    return _then(_$_VehicleType(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rowActive: freezed == rowActive
          ? _value.rowActive
          : rowActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      organizationId: freezed == organizationId
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_VehicleType implements _VehicleType {
  const _$_VehicleType(
      {this.id,
      this.code,
      this.name,
      this.description,
      this.createdAt,
      this.updatedAt,
      this.rowActive,
      this.organizationId});

  factory _$_VehicleType.fromJson(Map<String, dynamic> json) =>
      _$$_VehicleTypeFromJson(json);

  @override
  final String? id;
  @override
  final String? code;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final bool? rowActive;
  @override
  final String? organizationId;

  @override
  String toString() {
    return 'VehicleType(id: $id, code: $code, name: $name, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, rowActive: $rowActive, organizationId: $organizationId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VehicleType &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.rowActive, rowActive) ||
                other.rowActive == rowActive) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, code, name, description,
      createdAt, updatedAt, rowActive, organizationId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VehicleTypeCopyWith<_$_VehicleType> get copyWith =>
      __$$_VehicleTypeCopyWithImpl<_$_VehicleType>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VehicleTypeToJson(
      this,
    );
  }
}

abstract class _VehicleType implements VehicleType {
  const factory _VehicleType(
      {final String? id,
      final String? code,
      final String? name,
      final String? description,
      final DateTime? createdAt,
      final DateTime? updatedAt,
      final bool? rowActive,
      final String? organizationId}) = _$_VehicleType;

  factory _VehicleType.fromJson(Map<String, dynamic> json) =
      _$_VehicleType.fromJson;

  @override
  String? get id;
  @override
  String? get code;
  @override
  String? get name;
  @override
  String? get description;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  bool? get rowActive;
  @override
  String? get organizationId;
  @override
  @JsonKey(ignore: true)
  _$$_VehicleTypeCopyWith<_$_VehicleType> get copyWith =>
      throw _privateConstructorUsedError;
}

Organization _$OrganizationFromJson(Map<String, dynamic> json) {
  return _Organization.fromJson(json);
}

/// @nodoc
mixin _$Organization {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  bool? get rowActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrganizationCopyWith<Organization> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrganizationCopyWith<$Res> {
  factory $OrganizationCopyWith(
          Organization value, $Res Function(Organization) then) =
      _$OrganizationCopyWithImpl<$Res, Organization>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      DateTime? createdAt,
      DateTime? updatedAt,
      bool? rowActive});
}

/// @nodoc
class _$OrganizationCopyWithImpl<$Res, $Val extends Organization>
    implements $OrganizationCopyWith<$Res> {
  _$OrganizationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? rowActive = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rowActive: freezed == rowActive
          ? _value.rowActive
          : rowActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrganizationCopyWith<$Res>
    implements $OrganizationCopyWith<$Res> {
  factory _$$_OrganizationCopyWith(
          _$_Organization value, $Res Function(_$_Organization) then) =
      __$$_OrganizationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      DateTime? createdAt,
      DateTime? updatedAt,
      bool? rowActive});
}

/// @nodoc
class __$$_OrganizationCopyWithImpl<$Res>
    extends _$OrganizationCopyWithImpl<$Res, _$_Organization>
    implements _$$_OrganizationCopyWith<$Res> {
  __$$_OrganizationCopyWithImpl(
      _$_Organization _value, $Res Function(_$_Organization) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? rowActive = freezed,
  }) {
    return _then(_$_Organization(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rowActive: freezed == rowActive
          ? _value.rowActive
          : rowActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Organization implements _Organization {
  const _$_Organization(
      {this.id, this.name, this.createdAt, this.updatedAt, this.rowActive});

  factory _$_Organization.fromJson(Map<String, dynamic> json) =>
      _$$_OrganizationFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final bool? rowActive;

  @override
  String toString() {
    return 'Organization(id: $id, name: $name, createdAt: $createdAt, updatedAt: $updatedAt, rowActive: $rowActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Organization &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.rowActive, rowActive) ||
                other.rowActive == rowActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, createdAt, updatedAt, rowActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrganizationCopyWith<_$_Organization> get copyWith =>
      __$$_OrganizationCopyWithImpl<_$_Organization>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrganizationToJson(
      this,
    );
  }
}

abstract class _Organization implements Organization {
  const factory _Organization(
      {final String? id,
      final String? name,
      final DateTime? createdAt,
      final DateTime? updatedAt,
      final bool? rowActive}) = _$_Organization;

  factory _Organization.fromJson(Map<String, dynamic> json) =
      _$_Organization.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  bool? get rowActive;
  @override
  @JsonKey(ignore: true)
  _$$_OrganizationCopyWith<_$_Organization> get copyWith =>
      throw _privateConstructorUsedError;
}

AssetType _$AssetTypeFromJson(Map<String, dynamic> json) {
  return _AssetType.fromJson(json);
}

/// @nodoc
mixin _$AssetType {
  String? get id => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get mime => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  bool? get rowActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AssetTypeCopyWith<AssetType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssetTypeCopyWith<$Res> {
  factory $AssetTypeCopyWith(AssetType value, $Res Function(AssetType) then) =
      _$AssetTypeCopyWithImpl<$Res, AssetType>;
  @useResult
  $Res call(
      {String? id,
      String? code,
      String? mime,
      DateTime? createdAt,
      DateTime? updatedAt,
      bool? rowActive});
}

/// @nodoc
class _$AssetTypeCopyWithImpl<$Res, $Val extends AssetType>
    implements $AssetTypeCopyWith<$Res> {
  _$AssetTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? mime = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? rowActive = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      mime: freezed == mime
          ? _value.mime
          : mime // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rowActive: freezed == rowActive
          ? _value.rowActive
          : rowActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AssetTypeCopyWith<$Res> implements $AssetTypeCopyWith<$Res> {
  factory _$$_AssetTypeCopyWith(
          _$_AssetType value, $Res Function(_$_AssetType) then) =
      __$$_AssetTypeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? code,
      String? mime,
      DateTime? createdAt,
      DateTime? updatedAt,
      bool? rowActive});
}

/// @nodoc
class __$$_AssetTypeCopyWithImpl<$Res>
    extends _$AssetTypeCopyWithImpl<$Res, _$_AssetType>
    implements _$$_AssetTypeCopyWith<$Res> {
  __$$_AssetTypeCopyWithImpl(
      _$_AssetType _value, $Res Function(_$_AssetType) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? mime = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? rowActive = freezed,
  }) {
    return _then(_$_AssetType(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      mime: freezed == mime
          ? _value.mime
          : mime // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rowActive: freezed == rowActive
          ? _value.rowActive
          : rowActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AssetType implements _AssetType {
  const _$_AssetType(
      {this.id,
      this.code,
      this.mime,
      this.createdAt,
      this.updatedAt,
      this.rowActive});

  factory _$_AssetType.fromJson(Map<String, dynamic> json) =>
      _$$_AssetTypeFromJson(json);

  @override
  final String? id;
  @override
  final String? code;
  @override
  final String? mime;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final bool? rowActive;

  @override
  String toString() {
    return 'AssetType(id: $id, code: $code, mime: $mime, createdAt: $createdAt, updatedAt: $updatedAt, rowActive: $rowActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AssetType &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.mime, mime) || other.mime == mime) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.rowActive, rowActive) ||
                other.rowActive == rowActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, code, mime, createdAt, updatedAt, rowActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AssetTypeCopyWith<_$_AssetType> get copyWith =>
      __$$_AssetTypeCopyWithImpl<_$_AssetType>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AssetTypeToJson(
      this,
    );
  }
}

abstract class _AssetType implements AssetType {
  const factory _AssetType(
      {final String? id,
      final String? code,
      final String? mime,
      final DateTime? createdAt,
      final DateTime? updatedAt,
      final bool? rowActive}) = _$_AssetType;

  factory _AssetType.fromJson(Map<String, dynamic> json) =
      _$_AssetType.fromJson;

  @override
  String? get id;
  @override
  String? get code;
  @override
  String? get mime;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  bool? get rowActive;
  @override
  @JsonKey(ignore: true)
  _$$_AssetTypeCopyWith<_$_AssetType> get copyWith =>
      throw _privateConstructorUsedError;
}

FileSource _$FileSourceFromJson(Map<String, dynamic> json) {
  return _FileSource.fromJson(json);
}

/// @nodoc
mixin _$FileSource {
  String? get id => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get config => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  bool? get rowActive => throw _privateConstructorUsedError;
  String? get fileSourceTypeCode => throw _privateConstructorUsedError;
  FileSourceType? get fileSourceType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FileSourceCopyWith<FileSource> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FileSourceCopyWith<$Res> {
  factory $FileSourceCopyWith(
          FileSource value, $Res Function(FileSource) then) =
      _$FileSourceCopyWithImpl<$Res, FileSource>;
  @useResult
  $Res call(
      {String? id,
      String? code,
      String? config,
      DateTime? createdAt,
      DateTime? updatedAt,
      bool? rowActive,
      String? fileSourceTypeCode,
      FileSourceType? fileSourceType});

  $FileSourceTypeCopyWith<$Res>? get fileSourceType;
}

/// @nodoc
class _$FileSourceCopyWithImpl<$Res, $Val extends FileSource>
    implements $FileSourceCopyWith<$Res> {
  _$FileSourceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? config = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? rowActive = freezed,
    Object? fileSourceTypeCode = freezed,
    Object? fileSourceType = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      config: freezed == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rowActive: freezed == rowActive
          ? _value.rowActive
          : rowActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      fileSourceTypeCode: freezed == fileSourceTypeCode
          ? _value.fileSourceTypeCode
          : fileSourceTypeCode // ignore: cast_nullable_to_non_nullable
              as String?,
      fileSourceType: freezed == fileSourceType
          ? _value.fileSourceType
          : fileSourceType // ignore: cast_nullable_to_non_nullable
              as FileSourceType?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FileSourceTypeCopyWith<$Res>? get fileSourceType {
    if (_value.fileSourceType == null) {
      return null;
    }

    return $FileSourceTypeCopyWith<$Res>(_value.fileSourceType!, (value) {
      return _then(_value.copyWith(fileSourceType: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_FileSourceCopyWith<$Res>
    implements $FileSourceCopyWith<$Res> {
  factory _$$_FileSourceCopyWith(
          _$_FileSource value, $Res Function(_$_FileSource) then) =
      __$$_FileSourceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? code,
      String? config,
      DateTime? createdAt,
      DateTime? updatedAt,
      bool? rowActive,
      String? fileSourceTypeCode,
      FileSourceType? fileSourceType});

  @override
  $FileSourceTypeCopyWith<$Res>? get fileSourceType;
}

/// @nodoc
class __$$_FileSourceCopyWithImpl<$Res>
    extends _$FileSourceCopyWithImpl<$Res, _$_FileSource>
    implements _$$_FileSourceCopyWith<$Res> {
  __$$_FileSourceCopyWithImpl(
      _$_FileSource _value, $Res Function(_$_FileSource) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? config = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? rowActive = freezed,
    Object? fileSourceTypeCode = freezed,
    Object? fileSourceType = freezed,
  }) {
    return _then(_$_FileSource(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      config: freezed == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rowActive: freezed == rowActive
          ? _value.rowActive
          : rowActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      fileSourceTypeCode: freezed == fileSourceTypeCode
          ? _value.fileSourceTypeCode
          : fileSourceTypeCode // ignore: cast_nullable_to_non_nullable
              as String?,
      fileSourceType: freezed == fileSourceType
          ? _value.fileSourceType
          : fileSourceType // ignore: cast_nullable_to_non_nullable
              as FileSourceType?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FileSource implements _FileSource {
  const _$_FileSource(
      {this.id,
      this.code,
      this.config,
      this.createdAt,
      this.updatedAt,
      this.rowActive,
      this.fileSourceTypeCode,
      this.fileSourceType});

  factory _$_FileSource.fromJson(Map<String, dynamic> json) =>
      _$$_FileSourceFromJson(json);

  @override
  final String? id;
  @override
  final String? code;
  @override
  final String? config;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final bool? rowActive;
  @override
  final String? fileSourceTypeCode;
  @override
  final FileSourceType? fileSourceType;

  @override
  String toString() {
    return 'FileSource(id: $id, code: $code, config: $config, createdAt: $createdAt, updatedAt: $updatedAt, rowActive: $rowActive, fileSourceTypeCode: $fileSourceTypeCode, fileSourceType: $fileSourceType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FileSource &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.config, config) || other.config == config) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.rowActive, rowActive) ||
                other.rowActive == rowActive) &&
            (identical(other.fileSourceTypeCode, fileSourceTypeCode) ||
                other.fileSourceTypeCode == fileSourceTypeCode) &&
            (identical(other.fileSourceType, fileSourceType) ||
                other.fileSourceType == fileSourceType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, code, config, createdAt,
      updatedAt, rowActive, fileSourceTypeCode, fileSourceType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FileSourceCopyWith<_$_FileSource> get copyWith =>
      __$$_FileSourceCopyWithImpl<_$_FileSource>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FileSourceToJson(
      this,
    );
  }
}

abstract class _FileSource implements FileSource {
  const factory _FileSource(
      {final String? id,
      final String? code,
      final String? config,
      final DateTime? createdAt,
      final DateTime? updatedAt,
      final bool? rowActive,
      final String? fileSourceTypeCode,
      final FileSourceType? fileSourceType}) = _$_FileSource;

  factory _FileSource.fromJson(Map<String, dynamic> json) =
      _$_FileSource.fromJson;

  @override
  String? get id;
  @override
  String? get code;
  @override
  String? get config;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  bool? get rowActive;
  @override
  String? get fileSourceTypeCode;
  @override
  FileSourceType? get fileSourceType;
  @override
  @JsonKey(ignore: true)
  _$$_FileSourceCopyWith<_$_FileSource> get copyWith =>
      throw _privateConstructorUsedError;
}

FileSourceType _$FileSourceTypeFromJson(Map<String, dynamic> json) {
  return _FileSourceType.fromJson(json);
}

/// @nodoc
mixin _$FileSourceType {
  String? get code => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  bool? get rowActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FileSourceTypeCopyWith<FileSourceType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FileSourceTypeCopyWith<$Res> {
  factory $FileSourceTypeCopyWith(
          FileSourceType value, $Res Function(FileSourceType) then) =
      _$FileSourceTypeCopyWithImpl<$Res, FileSourceType>;
  @useResult
  $Res call(
      {String? code,
      String? name,
      String? description,
      DateTime? createdAt,
      DateTime? updatedAt,
      bool? rowActive});
}

/// @nodoc
class _$FileSourceTypeCopyWithImpl<$Res, $Val extends FileSourceType>
    implements $FileSourceTypeCopyWith<$Res> {
  _$FileSourceTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? rowActive = freezed,
  }) {
    return _then(_value.copyWith(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rowActive: freezed == rowActive
          ? _value.rowActive
          : rowActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FileSourceTypeCopyWith<$Res>
    implements $FileSourceTypeCopyWith<$Res> {
  factory _$$_FileSourceTypeCopyWith(
          _$_FileSourceType value, $Res Function(_$_FileSourceType) then) =
      __$$_FileSourceTypeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? code,
      String? name,
      String? description,
      DateTime? createdAt,
      DateTime? updatedAt,
      bool? rowActive});
}

/// @nodoc
class __$$_FileSourceTypeCopyWithImpl<$Res>
    extends _$FileSourceTypeCopyWithImpl<$Res, _$_FileSourceType>
    implements _$$_FileSourceTypeCopyWith<$Res> {
  __$$_FileSourceTypeCopyWithImpl(
      _$_FileSourceType _value, $Res Function(_$_FileSourceType) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? rowActive = freezed,
  }) {
    return _then(_$_FileSourceType(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rowActive: freezed == rowActive
          ? _value.rowActive
          : rowActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FileSourceType implements _FileSourceType {
  const _$_FileSourceType(
      {this.code,
      this.name,
      this.description,
      this.createdAt,
      this.updatedAt,
      this.rowActive});

  factory _$_FileSourceType.fromJson(Map<String, dynamic> json) =>
      _$$_FileSourceTypeFromJson(json);

  @override
  final String? code;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final bool? rowActive;

  @override
  String toString() {
    return 'FileSourceType(code: $code, name: $name, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, rowActive: $rowActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FileSourceType &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.rowActive, rowActive) ||
                other.rowActive == rowActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, code, name, description, createdAt, updatedAt, rowActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FileSourceTypeCopyWith<_$_FileSourceType> get copyWith =>
      __$$_FileSourceTypeCopyWithImpl<_$_FileSourceType>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FileSourceTypeToJson(
      this,
    );
  }
}

abstract class _FileSourceType implements FileSourceType {
  const factory _FileSourceType(
      {final String? code,
      final String? name,
      final String? description,
      final DateTime? createdAt,
      final DateTime? updatedAt,
      final bool? rowActive}) = _$_FileSourceType;

  factory _FileSourceType.fromJson(Map<String, dynamic> json) =
      _$_FileSourceType.fromJson;

  @override
  String? get code;
  @override
  String? get name;
  @override
  String? get description;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  bool? get rowActive;
  @override
  @JsonKey(ignore: true)
  _$$_FileSourceTypeCopyWith<_$_FileSourceType> get copyWith =>
      throw _privateConstructorUsedError;
}

VehicleModel _$VehicleModelFromJson(Map<String, dynamic> json) {
  return _VehicleModel.fromJson(json);
}

/// @nodoc
mixin _$VehicleModel {
  String? get id => throw _privateConstructorUsedError;
  String? get vehicleTypeId => throw _privateConstructorUsedError;
  VehicleType? get vehicleType => throw _privateConstructorUsedError;
  String? get vendorId => throw _privateConstructorUsedError;
  VehicleType? get vendor => throw _privateConstructorUsedError;
  String? get model => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  bool? get rowActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VehicleModelCopyWith<VehicleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleModelCopyWith<$Res> {
  factory $VehicleModelCopyWith(
          VehicleModel value, $Res Function(VehicleModel) then) =
      _$VehicleModelCopyWithImpl<$Res, VehicleModel>;
  @useResult
  $Res call(
      {String? id,
      String? vehicleTypeId,
      VehicleType? vehicleType,
      String? vendorId,
      VehicleType? vendor,
      String? model,
      String? name,
      String? description,
      DateTime? createdAt,
      DateTime? updatedAt,
      bool? rowActive});

  $VehicleTypeCopyWith<$Res>? get vehicleType;
  $VehicleTypeCopyWith<$Res>? get vendor;
}

/// @nodoc
class _$VehicleModelCopyWithImpl<$Res, $Val extends VehicleModel>
    implements $VehicleModelCopyWith<$Res> {
  _$VehicleModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? vehicleTypeId = freezed,
    Object? vehicleType = freezed,
    Object? vendorId = freezed,
    Object? vendor = freezed,
    Object? model = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? rowActive = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicleTypeId: freezed == vehicleTypeId
          ? _value.vehicleTypeId
          : vehicleTypeId // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicleType: freezed == vehicleType
          ? _value.vehicleType
          : vehicleType // ignore: cast_nullable_to_non_nullable
              as VehicleType?,
      vendorId: freezed == vendorId
          ? _value.vendorId
          : vendorId // ignore: cast_nullable_to_non_nullable
              as String?,
      vendor: freezed == vendor
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as VehicleType?,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rowActive: freezed == rowActive
          ? _value.rowActive
          : rowActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $VehicleTypeCopyWith<$Res>? get vehicleType {
    if (_value.vehicleType == null) {
      return null;
    }

    return $VehicleTypeCopyWith<$Res>(_value.vehicleType!, (value) {
      return _then(_value.copyWith(vehicleType: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $VehicleTypeCopyWith<$Res>? get vendor {
    if (_value.vendor == null) {
      return null;
    }

    return $VehicleTypeCopyWith<$Res>(_value.vendor!, (value) {
      return _then(_value.copyWith(vendor: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_VehicleModelCopyWith<$Res>
    implements $VehicleModelCopyWith<$Res> {
  factory _$$_VehicleModelCopyWith(
          _$_VehicleModel value, $Res Function(_$_VehicleModel) then) =
      __$$_VehicleModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? vehicleTypeId,
      VehicleType? vehicleType,
      String? vendorId,
      VehicleType? vendor,
      String? model,
      String? name,
      String? description,
      DateTime? createdAt,
      DateTime? updatedAt,
      bool? rowActive});

  @override
  $VehicleTypeCopyWith<$Res>? get vehicleType;
  @override
  $VehicleTypeCopyWith<$Res>? get vendor;
}

/// @nodoc
class __$$_VehicleModelCopyWithImpl<$Res>
    extends _$VehicleModelCopyWithImpl<$Res, _$_VehicleModel>
    implements _$$_VehicleModelCopyWith<$Res> {
  __$$_VehicleModelCopyWithImpl(
      _$_VehicleModel _value, $Res Function(_$_VehicleModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? vehicleTypeId = freezed,
    Object? vehicleType = freezed,
    Object? vendorId = freezed,
    Object? vendor = freezed,
    Object? model = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? rowActive = freezed,
  }) {
    return _then(_$_VehicleModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicleTypeId: freezed == vehicleTypeId
          ? _value.vehicleTypeId
          : vehicleTypeId // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicleType: freezed == vehicleType
          ? _value.vehicleType
          : vehicleType // ignore: cast_nullable_to_non_nullable
              as VehicleType?,
      vendorId: freezed == vendorId
          ? _value.vendorId
          : vendorId // ignore: cast_nullable_to_non_nullable
              as String?,
      vendor: freezed == vendor
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as VehicleType?,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rowActive: freezed == rowActive
          ? _value.rowActive
          : rowActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_VehicleModel implements _VehicleModel {
  const _$_VehicleModel(
      {this.id,
      this.vehicleTypeId,
      this.vehicleType,
      this.vendorId,
      this.vendor,
      this.model,
      this.name,
      this.description,
      this.createdAt,
      this.updatedAt,
      this.rowActive});

  factory _$_VehicleModel.fromJson(Map<String, dynamic> json) =>
      _$$_VehicleModelFromJson(json);

  @override
  final String? id;
  @override
  final String? vehicleTypeId;
  @override
  final VehicleType? vehicleType;
  @override
  final String? vendorId;
  @override
  final VehicleType? vendor;
  @override
  final String? model;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final bool? rowActive;

  @override
  String toString() {
    return 'VehicleModel(id: $id, vehicleTypeId: $vehicleTypeId, vehicleType: $vehicleType, vendorId: $vendorId, vendor: $vendor, model: $model, name: $name, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, rowActive: $rowActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VehicleModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.vehicleTypeId, vehicleTypeId) ||
                other.vehicleTypeId == vehicleTypeId) &&
            (identical(other.vehicleType, vehicleType) ||
                other.vehicleType == vehicleType) &&
            (identical(other.vendorId, vendorId) ||
                other.vendorId == vendorId) &&
            (identical(other.vendor, vendor) || other.vendor == vendor) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.rowActive, rowActive) ||
                other.rowActive == rowActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      vehicleTypeId,
      vehicleType,
      vendorId,
      vendor,
      model,
      name,
      description,
      createdAt,
      updatedAt,
      rowActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VehicleModelCopyWith<_$_VehicleModel> get copyWith =>
      __$$_VehicleModelCopyWithImpl<_$_VehicleModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VehicleModelToJson(
      this,
    );
  }
}

abstract class _VehicleModel implements VehicleModel {
  const factory _VehicleModel(
      {final String? id,
      final String? vehicleTypeId,
      final VehicleType? vehicleType,
      final String? vendorId,
      final VehicleType? vendor,
      final String? model,
      final String? name,
      final String? description,
      final DateTime? createdAt,
      final DateTime? updatedAt,
      final bool? rowActive}) = _$_VehicleModel;

  factory _VehicleModel.fromJson(Map<String, dynamic> json) =
      _$_VehicleModel.fromJson;

  @override
  String? get id;
  @override
  String? get vehicleTypeId;
  @override
  VehicleType? get vehicleType;
  @override
  String? get vendorId;
  @override
  VehicleType? get vendor;
  @override
  String? get model;
  @override
  String? get name;
  @override
  String? get description;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  bool? get rowActive;
  @override
  @JsonKey(ignore: true)
  _$$_VehicleModelCopyWith<_$_VehicleModel> get copyWith =>
      throw _privateConstructorUsedError;
}
