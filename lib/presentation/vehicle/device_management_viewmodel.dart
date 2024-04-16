import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/model/result.dart';
import '../../domain/model/vehicle.dart';
import 'package:get/get.dart';
import '../../domain/repository/vehicle_repository.dart';

final deviceManagementViewModel = StateNotifierProvider.autoDispose<
    DeviceManagementViewModel, ResultState<List<Vehicle>>>((ref) {
  return DeviceManagementViewModel(Get.find<VehicleRepository>());
});

class DeviceManagementViewModel
    extends StateNotifier<ResultState<List<Vehicle>>> {
  DeviceManagementViewModel(this.repository) : super(ResultState.init());

  final VehicleRepository repository;

  void getAllVehicle({bool isRefresh = false}) {
    if (!isRefresh) {
      state = ResultState.loading();
    }

    repository.getAllVehicle().then((value) {
      state = ResultState.success(value);
    }).catchError((error, _) {
      state = ResultState.error(Exception(error.toString()));
    });
  }

  void deleteVehicleByIds(List<String> deviceIds) {
    repository.deleteVehicleByIds(deviceIds).then((value) {
      getAllVehicle(isRefresh: true);
    });
  }
}
