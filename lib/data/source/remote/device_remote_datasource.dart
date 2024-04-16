import 'package:dio/dio.dart';
import 'package:elderselettricomobile/domain/model/mcu_connect.dart';
import 'package:elderselettricomobile/core/values/strings.dart';
import 'package:get/get.dart';
import 'package:dartz/dartz.dart';

import '../../../core/custom_exception.dart';
import '../../api_response.dart';

class DeviceRemoteDataSource {
  Future<Either<Exception, McuConnectResult>> connectMcu(String deviceId,
      String model, String deviceName, String? clientId) async {
    final dio = Get.find<Dio>();
    var data = {
      'serialNumber': deviceId,
      'model': model,
      'name': deviceName,
    };

    if (clientId != null) {
      data['clientId'] = clientId;
    }

    try {
      final response = await dio.post(
        '/device/mcu/connect',
        data: data,
      );

      final responseObj = ApiResponse.fromJson(
        response.data,
        (json) => McuConnectResult.fromJson(json),
      );

      if (responseObj.value != null) {
        return Right(responseObj.value);
      } else {
        return Left(RequestException('Response value is null'));
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
