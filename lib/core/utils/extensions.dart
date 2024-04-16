import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:geocoding/geocoding.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;
import 'package:path_provider/path_provider.dart';

extension XFileExt on XFile? {
  Future<File?> saveImage() async {
    if (this == null) return null;
    final imageFile = File(this!.path);
    final path = await getApplicationDocumentsDirectory();
    final fileName = Path.basename(this!.path);
    final newPath = '${path.path}/$fileName';
    final File localImage = await imageFile.copy(newPath);
    return localImage;
  }
}

extension CharacteristicExt on DiscoveredCharacteristic {
  QualifiedCharacteristic toQualifiedCharacteristic(String deviceId) {
    return QualifiedCharacteristic(
      characteristicId: characteristicId,
      serviceId: serviceId,
      deviceId: deviceId,
    );
  }
}

extension PlacemarkExt on Placemark {
  String toFullAddress() {
    return '${street} ${subLocality} ${locality}' +
        '${subAdministrativeArea} ${administrativeArea}' +
        '$postalCode}';
  }
}

extension BleStatusExt on BleStatus {
  String get displayName {
    switch (this) {
      case BleStatus.poweredOff:
        return 'turned off';
      default:
        return this.name;
    }
  }
}

extension EitherExtension<L, R> on Either<L, R> {
  R? getRight() => fold<R?>((_) => null, (r) => r);
  L? getLeft() => fold<L?>((l) => l, (_) => null);
}

double jsonToDouble(value) {
  if (value is double) return value;
  if (value is int) return value.toDouble();
  if (value is String) return double.tryParse(value) ?? 0.0;
  return 0.0;
}
