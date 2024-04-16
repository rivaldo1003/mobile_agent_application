import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../custom_exception.dart';

class NetworkClient {
  final dio = Get.find<Dio>();

  Future<dynamic> get(String url) async {
    try {
      final response = await dio.get(url);
      if (response.data['value'] == null) {
        throw RequestException('Response value is null.');
      }
      return response.data;
    } catch (e) {
      String? errorMessage = null;
      if (e is DioError) {
        errorMessage = e.response?.data['message'];
      }

      throw RequestException(
          errorMessage ?? 'Something is wrong, please try again later.');
    }
  }
}
