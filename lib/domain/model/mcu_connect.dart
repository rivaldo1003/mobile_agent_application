import 'package:freezed_annotation/freezed_annotation.dart';
import 'vehicle.dart' as local;

part 'mcu_connect.freezed.dart';

part 'mcu_connect.g.dart';

@freezed
class McuConnectResult with _$McuConnectResult {
  const factory McuConnectResult({
    required String deviceId,
    Vehicle? vehicle,
  }) = _McuConnectResult;

  factory McuConnectResult.fromJson(Map<String, dynamic> json) =>
      _$McuConnectResultFromJson(json);
}

@freezed
class Vehicle with _$Vehicle {
  const factory Vehicle({
    required String id,
    String? vehicleModelId,
    VehicleModel? vehicleModel,
    String? model,
    required String name,
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
    String? physicalNumber,
  }) = _Vehicle;

  factory Vehicle.fromJson(Map<String, dynamic> json) =>
      _$VehicleFromJson(json);
}

@freezed
class PrimaryPicture with _$PrimaryPicture {
  const factory PrimaryPicture({
    required String url,
  }) = _PrimaryPicture;

  factory PrimaryPicture.fromJson(Map<String, dynamic> json) =>
      _$PrimaryPictureFromJson(json);
}

@freezed
class CreatorUser with _$CreatorUser {
  const factory CreatorUser({
    required String id,
    String? name,
    String? username,
    String? email,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? rowActive,
    String? mobilePhoneNumber,
    String? mobilePhoneCountry,
    String? profilePictureAssetId,
    ProfilePictureAsset? profilePictureAsset,
  }) = _CreatorUser;

  factory CreatorUser.fromJson(Map<String, dynamic> json) =>
      _$CreatorUserFromJson(json);
}

@freezed
class ProfilePictureAsset with _$ProfilePictureAsset {
  const factory ProfilePictureAsset({
    String? id,
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
    String? byteLength,
  }) = _ProfilePictureAsset;

  factory ProfilePictureAsset.fromJson(Map<String, dynamic> json) =>
      _$ProfilePictureAssetFromJson(json);
}

@freezed
class ApplicationData with _$ApplicationData {
  const factory ApplicationData({
    String? id,
    String? name,
    String? packageName,
    String? domain,
    String? organizationId,
    Organization? organization,
    String? applicationGroupId,
    VehicleType? applicationGroup,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? rowActive,
  }) = _ApplicationData;

  factory ApplicationData.fromJson(Map<String, dynamic> json) =>
      _$ApplicationDataFromJson(json);
}

@freezed
class VehicleType with _$VehicleType {
  const factory VehicleType({
    String? id,
    String? code,
    String? name,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? rowActive,
    String? organizationId,
  }) = _VehicleType;

  factory VehicleType.fromJson(Map<String, dynamic> json) =>
      _$VehicleTypeFromJson(json);
}

@freezed
class Organization with _$Organization {
  const factory Organization({
    String? id,
    String? name,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? rowActive,
  }) = _Organization;

  factory Organization.fromJson(Map<String, dynamic> json) =>
      _$OrganizationFromJson(json);
}

@freezed
class AssetType with _$AssetType {
  const factory AssetType({
    String? id,
    String? code,
    String? mime,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? rowActive,
  }) = _AssetType;

  factory AssetType.fromJson(Map<String, dynamic> json) =>
      _$AssetTypeFromJson(json);
}

@freezed
class FileSource with _$FileSource {
  const factory FileSource({
    String? id,
    String? code,
    String? config,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? rowActive,
    String? fileSourceTypeCode,
    FileSourceType? fileSourceType,
  }) = _FileSource;

  factory FileSource.fromJson(Map<String, dynamic> json) =>
      _$FileSourceFromJson(json);
}

@freezed
class FileSourceType with _$FileSourceType {
  const factory FileSourceType({
    String? code,
    String? name,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? rowActive,
  }) = _FileSourceType;

  factory FileSourceType.fromJson(Map<String, dynamic> json) =>
      _$FileSourceTypeFromJson(json);
}

@freezed
class VehicleModel with _$VehicleModel {
  const factory VehicleModel({
    String? id,
    String? vehicleTypeId,
    VehicleType? vehicleType,
    String? vendorId,
    VehicleType? vendor,
    String? model,
    String? name,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? rowActive,
  }) = _VehicleModel;

  factory VehicleModel.fromJson(Map<String, dynamic> json) =>
      _$VehicleModelFromJson(json);
}

class McuConnect {
  String deviceId;
  local.Vehicle? vehicle;

  McuConnect({
    required this.deviceId,
    this.vehicle,
  });
}
