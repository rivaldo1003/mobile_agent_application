// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mcu_connect.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_McuConnectResult _$$_McuConnectResultFromJson(Map<String, dynamic> json) =>
    _$_McuConnectResult(
      deviceId: json['deviceId'] as String,
      vehicle: json['vehicle'] == null
          ? null
          : Vehicle.fromJson(json['vehicle'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_McuConnectResultToJson(_$_McuConnectResult instance) =>
    <String, dynamic>{
      'deviceId': instance.deviceId,
      'vehicle': instance.vehicle,
    };

_$_Vehicle _$$_VehicleFromJson(Map<String, dynamic> json) => _$_Vehicle(
      id: json['id'] as String,
      vehicleModelId: json['vehicleModelId'] as String?,
      vehicleModel: json['vehicleModel'] == null
          ? null
          : VehicleModel.fromJson(json['vehicleModel'] as Map<String, dynamic>),
      model: json['model'] as String?,
      name: json['name'] as String,
      description: json['description'] as String?,
      registrationNumber: json['registrationNumber'] as String?,
      color: json['color'] as String?,
      year: json['year'] as int?,
      purchaseDate: json['purchaseDate'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      rowActive: json['rowActive'] as bool?,
      creatorUserId: json['creatorUserId'] as String?,
      primaryPicture: json['primaryPicture'] == null
          ? null
          : PrimaryPicture.fromJson(
              json['primaryPicture'] as Map<String, dynamic>),
      creatorUser: json['creatorUser'] == null
          ? null
          : CreatorUser.fromJson(json['creatorUser'] as Map<String, dynamic>),
      physicalNumber: json['physicalNumber'] as String?,
    );

Map<String, dynamic> _$$_VehicleToJson(_$_Vehicle instance) =>
    <String, dynamic>{
      'id': instance.id,
      'vehicleModelId': instance.vehicleModelId,
      'vehicleModel': instance.vehicleModel,
      'model': instance.model,
      'name': instance.name,
      'description': instance.description,
      'registrationNumber': instance.registrationNumber,
      'color': instance.color,
      'year': instance.year,
      'purchaseDate': instance.purchaseDate,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'rowActive': instance.rowActive,
      'creatorUserId': instance.creatorUserId,
      'primaryPicture': instance.primaryPicture,
      'creatorUser': instance.creatorUser,
      'physicalNumber': instance.physicalNumber,
    };

_$_PrimaryPicture _$$_PrimaryPictureFromJson(Map<String, dynamic> json) =>
    _$_PrimaryPicture(
      url: json['url'] as String,
    );

Map<String, dynamic> _$$_PrimaryPictureToJson(_$_PrimaryPicture instance) =>
    <String, dynamic>{
      'url': instance.url,
    };

_$_CreatorUser _$$_CreatorUserFromJson(Map<String, dynamic> json) =>
    _$_CreatorUser(
      id: json['id'] as String,
      name: json['name'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      rowActive: json['rowActive'] as bool?,
      mobilePhoneNumber: json['mobilePhoneNumber'] as String?,
      mobilePhoneCountry: json['mobilePhoneCountry'] as String?,
      profilePictureAssetId: json['profilePictureAssetId'] as String?,
      profilePictureAsset: json['profilePictureAsset'] == null
          ? null
          : ProfilePictureAsset.fromJson(
              json['profilePictureAsset'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_CreatorUserToJson(_$_CreatorUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'email': instance.email,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'rowActive': instance.rowActive,
      'mobilePhoneNumber': instance.mobilePhoneNumber,
      'mobilePhoneCountry': instance.mobilePhoneCountry,
      'profilePictureAssetId': instance.profilePictureAssetId,
      'profilePictureAsset': instance.profilePictureAsset,
    };

_$_ProfilePictureAsset _$$_ProfilePictureAssetFromJson(
        Map<String, dynamic> json) =>
    _$_ProfilePictureAsset(
      id: json['id'] as String?,
      description: json['description'] as String?,
      applicationId: json['applicationId'] as String?,
      application: json['application'] == null
          ? null
          : ApplicationData.fromJson(
              json['application'] as Map<String, dynamic>),
      assetTypeId: json['assetTypeId'] as String?,
      assetType: json['assetType'] == null
          ? null
          : AssetType.fromJson(json['assetType'] as Map<String, dynamic>),
      fileSourceId: json['fileSourceId'] as String?,
      fileSource: json['fileSource'] == null
          ? null
          : FileSource.fromJson(json['fileSource'] as Map<String, dynamic>),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      rowActive: json['rowActive'] as bool?,
      path: json['path'] as String?,
      protected: json['protected'] as bool?,
      name: json['name'] as String?,
      byteLength: json['byteLength'] as String?,
    );

Map<String, dynamic> _$$_ProfilePictureAssetToJson(
        _$_ProfilePictureAsset instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'applicationId': instance.applicationId,
      'application': instance.application,
      'assetTypeId': instance.assetTypeId,
      'assetType': instance.assetType,
      'fileSourceId': instance.fileSourceId,
      'fileSource': instance.fileSource,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'rowActive': instance.rowActive,
      'path': instance.path,
      'protected': instance.protected,
      'name': instance.name,
      'byteLength': instance.byteLength,
    };

_$_ApplicationData _$$_ApplicationDataFromJson(Map<String, dynamic> json) =>
    _$_ApplicationData(
      id: json['id'] as String?,
      name: json['name'] as String?,
      packageName: json['packageName'] as String?,
      domain: json['domain'] as String?,
      organizationId: json['organizationId'] as String?,
      organization: json['organization'] == null
          ? null
          : Organization.fromJson(json['organization'] as Map<String, dynamic>),
      applicationGroupId: json['applicationGroupId'] as String?,
      applicationGroup: json['applicationGroup'] == null
          ? null
          : VehicleType.fromJson(
              json['applicationGroup'] as Map<String, dynamic>),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      rowActive: json['rowActive'] as bool?,
    );

Map<String, dynamic> _$$_ApplicationDataToJson(_$_ApplicationData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'packageName': instance.packageName,
      'domain': instance.domain,
      'organizationId': instance.organizationId,
      'organization': instance.organization,
      'applicationGroupId': instance.applicationGroupId,
      'applicationGroup': instance.applicationGroup,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'rowActive': instance.rowActive,
    };

_$_VehicleType _$$_VehicleTypeFromJson(Map<String, dynamic> json) =>
    _$_VehicleType(
      id: json['id'] as String?,
      code: json['code'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      rowActive: json['rowActive'] as bool?,
      organizationId: json['organizationId'] as String?,
    );

Map<String, dynamic> _$$_VehicleTypeToJson(_$_VehicleType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'description': instance.description,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'rowActive': instance.rowActive,
      'organizationId': instance.organizationId,
    };

_$_Organization _$$_OrganizationFromJson(Map<String, dynamic> json) =>
    _$_Organization(
      id: json['id'] as String?,
      name: json['name'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      rowActive: json['rowActive'] as bool?,
    );

Map<String, dynamic> _$$_OrganizationToJson(_$_Organization instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'rowActive': instance.rowActive,
    };

_$_AssetType _$$_AssetTypeFromJson(Map<String, dynamic> json) => _$_AssetType(
      id: json['id'] as String?,
      code: json['code'] as String?,
      mime: json['mime'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      rowActive: json['rowActive'] as bool?,
    );

Map<String, dynamic> _$$_AssetTypeToJson(_$_AssetType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'mime': instance.mime,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'rowActive': instance.rowActive,
    };

_$_FileSource _$$_FileSourceFromJson(Map<String, dynamic> json) =>
    _$_FileSource(
      id: json['id'] as String?,
      code: json['code'] as String?,
      config: json['config'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      rowActive: json['rowActive'] as bool?,
      fileSourceTypeCode: json['fileSourceTypeCode'] as String?,
      fileSourceType: json['fileSourceType'] == null
          ? null
          : FileSourceType.fromJson(
              json['fileSourceType'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_FileSourceToJson(_$_FileSource instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'config': instance.config,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'rowActive': instance.rowActive,
      'fileSourceTypeCode': instance.fileSourceTypeCode,
      'fileSourceType': instance.fileSourceType,
    };

_$_FileSourceType _$$_FileSourceTypeFromJson(Map<String, dynamic> json) =>
    _$_FileSourceType(
      code: json['code'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      rowActive: json['rowActive'] as bool?,
    );

Map<String, dynamic> _$$_FileSourceTypeToJson(_$_FileSourceType instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'description': instance.description,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'rowActive': instance.rowActive,
    };

_$_VehicleModel _$$_VehicleModelFromJson(Map<String, dynamic> json) =>
    _$_VehicleModel(
      id: json['id'] as String?,
      vehicleTypeId: json['vehicleTypeId'] as String?,
      vehicleType: json['vehicleType'] == null
          ? null
          : VehicleType.fromJson(json['vehicleType'] as Map<String, dynamic>),
      vendorId: json['vendorId'] as String?,
      vendor: json['vendor'] == null
          ? null
          : VehicleType.fromJson(json['vendor'] as Map<String, dynamic>),
      model: json['model'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      rowActive: json['rowActive'] as bool?,
    );

Map<String, dynamic> _$$_VehicleModelToJson(_$_VehicleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'vehicleTypeId': instance.vehicleTypeId,
      'vehicleType': instance.vehicleType,
      'vendorId': instance.vendorId,
      'vendor': instance.vendor,
      'model': instance.model,
      'name': instance.name,
      'description': instance.description,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'rowActive': instance.rowActive,
    };
