import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'dart:developer' as dev;
import 'package:elderselettricomobile/core/values/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioClient {
  const DioClient(this._baseUrl);

  final String _baseUrl;

  Dio create() {
    final dio = Dio(_createBaseOptions());
    dio.interceptors.add(ApiInterceptor());
    if (kDebugMode) {
      dio.interceptors.add(DioLoggingInterceptor());
    }
    return dio;
  }

  BaseOptions _createBaseOptions() {
    return BaseOptions(
      baseUrl: _baseUrl,
    );
  }
}

class ApiInterceptor extends Interceptor {
  final int retries = 1;

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final packageInfo = await PackageInfo.fromPlatform();

    options.headers.addAll({
      HttpHeaders.contentTypeHeader: 'application/json',
      'x-client-id': packageInfo.packageName,
      'x-client-version': packageInfo.version,
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.get(KEY_ACCESS_TOKEN);
    if (accessToken != null) {
      options.headers.putIfAbsent(
          HttpHeaders.authorizationHeader, () => 'Bearer $accessToken');
    }

    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode != 401) {
      return super.onError(err, handler);
    }
    final attempt = err.requestOptions._retryAttempt + 1;
    if (attempt > retries) return super.onError(err, handler);

    try {
      final dio = Dio();
      final pref = await SharedPreferences.getInstance();
      var refreshToken = pref.get(KEY_REFRESH_TOKEN);
      var accessToken = pref.get(KEY_ACCESS_TOKEN);
      if (refreshToken == null) return super.onError(err, handler);
      dio.options.headers['x-rtoken'] = refreshToken;
      dio.options.headers['authorization'] = 'Bearer $accessToken';
      final response = await dio.get('$API_BASE_URL/refreshToken');

      if (response.statusCode == 200) {
        String accessToken = response.data?['value'][KEY_ACCESS_TOKEN];
        String refreshToken = response.data?['value'][KEY_REFRESH_TOKEN];
        await pref.setString(KEY_ACCESS_TOKEN, accessToken);
        await pref.setString(KEY_REFRESH_TOKEN, refreshToken);

        final options = err.requestOptions
          ..headers[HttpHeaders.authorizationHeader] = 'Bearer $accessToken';
        final newResponse = await dio.fetch<void>(options);
        return handler.resolve(newResponse);
      }
    } catch (e) {
      if (e is DioError) {
        dev.log(
            'ApiInterceptor, error refresh token: ${e.response?.statusCode} ${e.response}');
      } else {
        dev.log('ApiInterceptor, error: ${e}');
      }
    }

    super.onError(err, handler);
  }
}

class DioLoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    dev.log(
        "┌----- Request ------------------------------------------------------------------");
    dev.log('| [DIO] ${options.method} ${options.uri}');
    if (options.data != null) {
      dev.log('| ${options.data.toString()}');
    }
    dev.log('| Headers:');
    options.headers.forEach((key, value) {
      dev.log('|\t$key: $value');
    });
    dev.log(
        "└--------------------------------------------------------------------------------");
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    dev.log(
        "┌----- Response -----------------------------------------------------------------");
    dev.log(
        "| [DIO] ${response.statusCode} ${response.statusMessage} ${response.requestOptions.uri}");
    final responseData = response.data;
    if (responseData != null) {
      if (responseData is Map) {
        final jsonResponse = jsonEncode(responseData);
        dev.log('| ${jsonResponse}');
      } else {
        dev.log('| ${response.data.toString()}');
      }
    }
    dev.log(
        "└--------------------------------------------------------------------------------");
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError error, ErrorInterceptorHandler handler) {
    dev.log("[DIO] Error: ${error.error}: ${error.response.toString()}");
    super.onError(error, handler);
  }
}

extension AuthRequestOptionsX on RequestOptions {
  int get _retryAttempt => (extra['auth_retry_attempt'] as int?) ?? 0;
  set _retryAttempt(final int attempt) => extra['auth_retry_attempt'] = attempt;
}
