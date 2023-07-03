// ignore_for_file: annotate_overrides, overridden_fields
import 'package:playbox/services/api/source/base_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:playbox/services/api/source/model_factory.dart';

class ApiResponse<T> extends BaseResponse {
  final T? data;

  ApiResponse({
    this.data,
    required num status,
    required String message,
  }) : super(message: message, status: status);

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return ApiResponse<T>(
      message: json['message'],
      status: json['status'],
      data: _Converter<T>().fromJson(json['data']),
    );
  }
}

class ApiResponses<T> extends BaseResponse {
  List<T>? data;

  ApiResponses({
    this.data = const [],
    required num status,
    required String message,
  }) : super(message: message, status: status);

  factory ApiResponses.fromJson(
    Map<String, dynamic> json,
  ) {
    return ApiResponses<T>(
      message: json['message'],
      status: json['status'],
      data: List<T>.from((json["results"] ?? json["data"])
          .map((x) => _Converter<T?>().fromJson(x))),
    );
  }
}

class _Converter<T> implements JsonConverter<T?, Object?> {
  const _Converter();

  @override
  T? fromJson(Object? json) {
    if (json is Map<String, dynamic>) {
      return ModelFactory.fromJson(T, json) as T;
    }
    return json as T;
  }

  @override
  Object toJson(T? object) {
    return (object as Object);
  }
}
