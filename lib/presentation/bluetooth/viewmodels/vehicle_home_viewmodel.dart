import 'package:elderselettricomobile/core/custom_exception.dart';
import 'package:elderselettricomobile/core/base/base_view_model.dart';
import 'package:get/get.dart';

import '../../../domain/model/result.dart';
import '../../../domain/model/vehicle.dart';
import '../../../domain/repository/vehicle_repository.dart';

class VehicleHomeViewModel extends StateViewModel<ResultState<Vehicle>> {
  final VehicleRepository repository = Get.find<VehicleRepository>();

  VehicleHomeViewModel() : super(ResultState.init());

  void getVehicleByDeviceId(String deviceId) {
    repository.getVehicleByDeviceId(deviceId).then((value) {
      if (value != null) {
        state = ResultState.success(value);
      } else {
        state = ResultState.error(VehicleNotFoundException());
      }
    }).catchError((error, _) {
      state = ResultState.error(Exception(error.toString()));
    });
  }
}
