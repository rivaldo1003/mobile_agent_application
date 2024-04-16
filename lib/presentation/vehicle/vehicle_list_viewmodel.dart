import 'package:elderselettricomobile/core/base/base_view_model.dart';

import '../../domain/model/result.dart';
import '../../domain/model/vehicle.dart';
import 'package:get/get.dart';
import '../../domain/repository/vehicle_repository.dart';

class VehicleListViewModel extends StateViewModel<ResultState<List<Vehicle>>> {
  final VehicleRepository repository = Get.find<VehicleRepository>();

  VehicleListViewModel() : super(ResultState.loading());

  void getAllVehicle() {
    if (!state.isLoading) {
      state = ResultState.loading();
    }

    repository.getAllVehicle().then((value) {
      state = ResultState.success(value);
    }).catchError((error, _) {
      state = ResultState.error(Exception(error.toString()));
    });
  }
}
