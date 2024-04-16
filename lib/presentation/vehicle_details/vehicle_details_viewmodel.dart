import 'dart:convert';
import 'dart:io';

import 'package:elderselettricomobile/domain/model/battery.dart';
import 'package:elderselettricomobile/domain/model/result.dart';
import 'package:get/get.dart';
import 'package:elderselettricomobile/domain/repository/vehicle_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mime/mime.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/model/vehicle.dart';

final vehicleDetailsViewModel = StateNotifierProvider.autoDispose<
    VehicleDetailsViewModel, ResultState<Vehicle>>((ref) {
  return VehicleDetailsViewModel(Get.find<VehicleRepository>());
});

class VehicleDetailsViewModel extends StateNotifier<ResultState<Vehicle>> {
  VehicleDetailsViewModel(this.repository) : super(ResultState.init());

  final VehicleRepository repository;

  Future<void> addVehicle(
    String serverDeviceId,
    String deviceId,
    String? vehicleId,
    String vehicleName,
    String registrationNumber,
    String model,
    String year,
    String color,
    String purchaseDate,
    String? photoPath,
    String? physicalNumber,
    String? creatorUserId,
    BatteryType selectedBattery,
  ) async {
    state = ResultState.loading();

    String? base64Image;

    if (photoPath != null && photoPath.isNotEmpty) {
      final mimeType = lookupMimeType(photoPath);
      final bytes = File(photoPath).readAsBytesSync();
      final base64 = base64Encode(bytes);
      base64Image = 'data:$mimeType;base64,$base64';
    }

    if (vehicleId != null) {
      final result = await repository.updateVehicle(
        serverDeviceId,
        deviceId,
        vehicleId,
        vehicleName,
        registrationNumber,
        model,
        year,
        color,
        purchaseDate,
        photoPath,
        null,
        physicalNumber,
        creatorUserId,
        base64Image,
      );

      result.fold(
        (e) => state = ResultState.error(e),
        (data) => _onSuccess(data, deviceId, selectedBattery),
      );
    } else {
      final result = await repository.saveVehicle(
        serverDeviceId,
        deviceId,
        vehicleName,
        registrationNumber,
        model,
        year,
        color,
        purchaseDate,
        photoPath,
        null,
        null,
        null,
        null,
        base64Image,
      );

      result.fold(
        (e) => state = ResultState.error(e),
        (data) => _onSuccess(data, deviceId, selectedBattery),
      );
    }
  }

  Future<void> _onSuccess(
      Vehicle data, String deviceId, BatteryType selectedBattery) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString('selectedBattery_$deviceId', selectedBattery.text);
    state = ResultState.success(data);
  }
}
