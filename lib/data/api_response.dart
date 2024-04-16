import 'package:json_annotation/json_annotation.dart';

part 'api_response.g.dart';

class BaseResponse {
  String message;
  dynamic code;

  BaseResponse({required this.message, this.code});

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return BaseResponse(code: json["code"], message: json["message"]);
  }
}

@JsonSerializable(genericArgumentFactories: true)
class ApiResponse<T> extends BaseResponse {
  T? value;

  ApiResponse({
    required String message,
    dynamic code,
    this.value,
  }) : super(message: message, code: code);

  factory ApiResponse.fromJson(
      Map<String, dynamic> json, Function(Map<String, dynamic>) create) {
    return ApiResponse<T>(
      code: json["code"],
      message: json["message"],
      value: json["value"] != null ? create(json["value"]) : null,
    );
  }
}

@JsonSerializable(genericArgumentFactories: true)
class ApiListResponse<T> extends BaseResponse {
  List<T>? value;

  ApiListResponse({
    required String message,
    dynamic code,
    this.value,
  }) : super(message: message, code: code);

  factory ApiListResponse.fromJson(
      Map<String, dynamic> json, Function(Map<String, dynamic>) create) {
    var value = <T>[];

    if (json['value'] != null) {
      json['value'].forEach((v) {
        value.add(create(v));
      });
    }

    return ApiListResponse<T>(
      code: json["code"],
      message: json["message"],
      value: value,
    );
  }
}
