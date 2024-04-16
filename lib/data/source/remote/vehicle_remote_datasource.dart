import 'package:dio/dio.dart';
import 'package:elderselettricomobile/core/values/strings.dart';
import 'package:get/get.dart';
import 'package:dartz/dartz.dart';

import '../../../domain/model/mcu_connect.dart';
import '../../../core/custom_exception.dart';
import '../../../domain/model/vehicle.dart' as local;
import '../../api_response.dart';

class VehicleRemoteDataSource {
  Future<Either<Exception, List<Vehicle>>> getAllVehicle() async {
    final dio = Get.find<Dio>();
    try {
      final response = await dio.get('/vehicle');

      final responseObj = ApiListResponse<Vehicle>.fromJson(
        response.data,
        (json) => Vehicle.fromJson(json),
      );

      if (responseObj.value != null) {
        return Right(responseObj.value!);
      } else {
        return Left(
          RequestException(
            'Response value is null',
          ),
        );
      }
    } catch (e) {
      String? errorMessage = null;
      if (e is DioError) {
        errorMessage = e.response?.data['message'];
      }

      return Left(
        RequestException(errorMessage ?? AppStrings.somethingIsWrong),
      );
    }
  }

  Future<Either<Exception, Vehicle>> saveVehicle(
    String serverDeviceId,
    local.Vehicle vehicle,
    String? base64Image,
  ) async {
    final dio = Get.find<Dio>();
    final uniqueValue = DateTime.now().microsecondsSinceEpoch.toString();
    var data = {
      'deviceId': serverDeviceId,
      'physicalNumber': uniqueValue,
      'model': vehicle.model,
      'name': vehicle.vehicleName,
      'registrationNumber': vehicle.registrationNumber,
      'color': vehicle.color,
      'year': int.parse(vehicle.year),
      'purchaseDate': vehicle.purchaseDate,
    };

    if (base64Image != null) {
      data['imageFile'] = base64Image;
    }

    try {
      final response = await dio.post('/vehicle', data: data);

      final responseObj = ApiResponse<Vehicle>.fromJson(
        response.data,
        (json) => Vehicle.fromJson(json),
      );

      if (responseObj.value != null) {
        final value = responseObj.value!;
        return Right(value);
      } else {
        return Left(RequestException(AppStrings.somethingIsWrong));
      }
    } catch (e) {
      String? errorMessage = null;
      if (e is DioError) {
        errorMessage = e.response?.data['message'];
      }

      return Left(
        RequestException(errorMessage ?? AppStrings.somethingIsWrong),
      );
    }
  }

  Future<Either<Exception, Vehicle>> updateVehicle(
    String serverDeviceId,
    local.Vehicle vehicle,
    String? base64Image,
  ) async {
    final dio = Get.find<Dio>();
    var data = {
      'deviceId': serverDeviceId,
      'physicalNumber': vehicle.physicalNumber,
      'model': vehicle.model,
      'name': vehicle.vehicleName,
      'registrationNumber': vehicle.registrationNumber,
      'color': vehicle.color,
      'year': int.parse(vehicle.year),
      'purchaseDate': vehicle.purchaseDate,
    };

    if (base64Image != null) {
      data['imageFile'] = base64Image;
    }

    try {
      final response =
          await dio.patch('/vehicle/${vehicle.vehicleId}', data: data);

      final responseObj = ApiResponse<Vehicle>.fromJson(
        response.data,
        (json) => Vehicle.fromJson(json),
      );

      if (responseObj.value != null) {
        final value = responseObj.value!;
        return Right(value);
      } else {
        return Left(RequestException(AppStrings.somethingIsWrong));
      }
    } catch (e) {
      String? errorMessage = null;
      if (e is DioError) {
        errorMessage = e.response?.data['message'];
      }

      return Left(
          RequestException(errorMessage ?? AppStrings.somethingIsWrong));
    }
  }
}
