import 'dart:convert';

import 'package:elderselettricomobile/core/custom_exception.dart';
import 'package:elderselettricomobile/core/utils/extensions.dart';
import 'package:elderselettricomobile/core/utils/mcu_util.dart';

import '../../presentation/configuration/settings_item_pages.dart';

class McuWrite {
  int sn;
  int version;
  int? packageType;
  int? packageId;
  int? dataId;
  McuData data;

  McuWrite({
    required this.sn,
    required this.version,
    required this.packageId,
    required this.data,
    this.dataId,
    this.packageType,
  });

  Map<String, dynamic> toJson() {
    if (version == 1) {
      return {
        'sn': sn,
        'version': version,
        'package_id': packageId,
        'data': data.toJson(),
      };
    } else {
      Map<String, dynamic> jsonData = {
        'sn': sn,
        'version': version,
        'package_id': packageId,
        'package_type': packageType,
        'data_id': dataId,
        'data': data.toJson(),
      };

      return jsonData;
    }
  }
}

class McuObject {
  String sn;
  int version;
  int packageId;
  McuData? data;

  // version 2
  int? dataId;
  int? packageType;

  McuObject({
    required this.sn,
    required this.version,
    required this.packageId,
    this.data,
    this.dataId,
    this.packageType,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'sn': sn,
      'version': version,
      'package_id': packageId,
      'data_id': dataId,
      'data': data?.toJson(),
    };
  }

  factory McuObject.fromJson(Map<String, dynamic> json) {
    final version = json['version'] as int;
    final packageId = json['package_id'] as int;
    final jsonData = json['data'] as Map<String, dynamic>;
    final dataId = json['data_id'];
    final packageType = json['package_type'];

    McuData? data;

    if (packageId == 800) {
      data = McuData800.fromJson(jsonData);
    }

    if (packageId == 803) {
      data = McuData803.fromJson(jsonData);
    }

    if (packageId == 801) {
      data = McuData801.fromJson(jsonData);
    }

    return McuObject(
      sn: json['sn'].toString(),
      version: version,
      packageId: packageId,
      data: data,
      dataId: dataId,
      packageType: packageType,
    );
  }

  @override
  String toString() {
    return 'McuObject(sn: $sn, version: $version, packageId: $packageId,' +
        ' data: $data, dataId: $dataId, packageType: $packageType)';
  }
}

class McuData {
  int dataLength;
  dynamic dataValue;

  McuData({required this.dataLength, required this.dataValue});

  Map<String, dynamic> toJson() {
    return {
      'data_length': this.dataLength,
      'data_value': this.dataValue,
    };
  }

  @override
  String toString() =>
      'BaseMcuData(dataLength: $dataLength, dataValue: $dataValue)';
}

class McuData800 extends McuData {
  bool isConnected;

  McuData800({
    required int dataLength,
    required dataValue,
    required this.isConnected,
  }) : super(dataLength: dataLength, dataValue: dataValue);

  factory McuData800.fromJson(Map<String, dynamic> json) {
    final value = json['data_value'] as String;
    final dataValue = jsonDecode(value) as List;
    final connectionState = dataValue.isEmpty ? false : dataValue[0] == 1;
    return McuData800(
      dataLength: json['data_lenght'] as int,
      dataValue: dataValue,
      isConnected: connectionState,
    );
  }
}

class McuTelemetryData extends McuData {
  dynamic singleValue;
  Map<McuValue, dynamic> values;

  McuTelemetryData({
    required int dataLength,
    required dataValue,
    required this.values,
    required this.singleValue,
  }) : super(dataLength: dataLength, dataValue: dataValue);
}

class McuData801 extends McuTelemetryData {
  McuData801({
    required int dataLength,
    required dataValue,
    Map<McuValue, dynamic>? values,
    dynamic singleValue = null,
  }) : super(
          dataLength: dataLength,
          dataValue: dataValue,
          values: values ?? {},
          singleValue: singleValue,
        );

  factory McuData801.fromJson(Map<String, dynamic> json) {
    final value = json['data_value'];
    final dataValue = jsonDecode(value) as List;

    if (dataValue.length == 1) {
      return McuData801(
        dataLength: json['data_lenght'] as int,
        dataValue: dataValue,
        singleValue: dataValue,
      );
    }

    Map<McuValue, dynamic>? values = {};

    values[McuValue.battVoltage] = dataValue[1] > 150
        ? 150
        : dataValue[1] < 0
            ? 0
            : dataValue[1];
    values[McuValue.battCurrent] = dataValue[2] > 250
        ? 250
        : dataValue[2] < 0
            ? 0
            : dataValue[2];
    values[McuValue.temp] = dataValue[3];

    values[McuValue.tripDistance] = jsonToDouble(dataValue[4]);
    values[McuValue.status] = dataValue[5];
    values[McuValue.mode] = getDeviceMode(dataValue[6]).text;
    var doubleAvs = jsonToDouble(dataValue[7]);
    values[McuValue.avs] = doubleAvs > 255
        ? 255
        : doubleAvs < 0
            ? 0
            : doubleAvs;
    var mxs = dataValue[8] > 255
        ? 255
        : dataValue[8] < 0
            ? 0
            : dataValue[8];

    values[McuValue.mxs] = ((Setting.tireDiameter ?? 0.43) * 100) * (mxs ?? 0);

    values[McuValue.breaking] = dataValue[10];

    values[McuValue.speed] =
        ((Setting.tireDiameter ?? 0.43) * 100) * dataValue[9];

    if (dataValue.length > 14) {
      values[McuValue.rpm] = dataValue[14];
    }

    return McuData801(
      dataLength: json['data_lenght'] as int,
      dataValue: dataValue,
      values: values,
    );
  }
}

class McuData803 extends McuData {
  bool vehicleOn;
  bool controllerStatus;
  bool digitalExhaustOn;

  McuData803({
    required int dataLength,
    required dataValue,
    required this.vehicleOn,
    required this.controllerStatus,
    required this.digitalExhaustOn,
  }) : super(dataLength: dataLength, dataValue: dataValue);

  factory McuData803.fromJson(Map<String, dynamic> json) {
    final value = json['data_value'] as String;
    final dataValue = jsonDecode(value) as List;
    final dataLength = json['data_lenght'] as int;

    if (dataLength == 0) {
      return McuData803(
        dataLength: dataLength,
        dataValue: dataValue,
        vehicleOn: false,
        controllerStatus: false,
        digitalExhaustOn: false,
      );
    }

    final vehicleOn = dataValue[0] == 1;
    final controller = dataValue[1] == 1;
    return McuData803(
      dataLength: dataLength,
      dataValue: dataValue,
      vehicleOn: vehicleOn,
      controllerStatus: controller,
      digitalExhaustOn: false,
    );
  }
}
