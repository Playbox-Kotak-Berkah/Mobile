import 'package:dio/dio.dart';
import 'package:playbox/services/api/api.dart';
import 'package:playbox/services/api/api_utils.dart';
import 'package:playbox/services/api/request_method.dart';
import 'package:playbox/services/api/source/api_response.dart';

Future<ApiResponse<T>?> fetchData<T>({
  required String url,
  required RequestMethod method,
  Object? data,
  bool? isAlert = true,
  Map<String, String>? header,
  Map<String, dynamic>? queryParameters,
}) async {
  try {
    final api = Api(isFormData: data is FormData);

    Response request = await api.request(
      url,
      data: data,
      queryParameters: queryParameters,
      options: Options(method: method.value),
    );

    if (T == dynamic) {
      return request.data;
    }

    // if (request.data['data'].runtimeType != T) {
    //   return request;
    // }

    ApiResponse<T> response = ApiResponse.fromJson(request.data);
    return response;
  } on DioException catch (e) {
    final response = e.response;
    if (response?.statusCode == 409) {
      ApiUtils.logout();
    }
    if (isAlert!) {
      if (response?.data?['error'] != null) {
        ApiUtils.showAlert(response?.data['error']);
      } else {
        ApiUtils.showAlert(e.response?.data ??
            e.response?.statusMessage ??
            e.message ??
            e.toString());
      }
    }
    return null;
  }
}

Future<ApiResponses<T>?> fetchMultipleData<T>({
  required String url,
  required RequestMethod method,
  Object? data,
  bool? isAlert = true,
  Map<String, dynamic>? queryParameters,
}) async {
  try {
    final api = Api();
    Response request = await api.request(
      url,
      data: data,
      queryParameters: queryParameters,
      options: Options(method: method.value),
    );

    if (T == dynamic) {
      return request.data;
    }

    ApiResponses<T> response = ApiResponses.fromJson(request.data);
    return response;
  } on DioException catch (e) {
    final response = e.response;
    if (response?.statusCode == 409) {
      ApiUtils.logout();
    }
    if (isAlert!) {
      if (response?.data.runtimeType == Map) {
        ApiUtils.showAlert(response?.data?['error']);
      } else {
        ApiUtils.showAlert(
            e.response?.statusMessage ?? e.message ?? e.toString());
      }
    }
    return null;
  }
}
