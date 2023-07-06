import 'package:dio/dio.dart';
import 'package:playbox/services/token/app_token.dart';

class ContentTypeInterceptor extends Interceptor {
  static const String jsonContentType = 'application/json';
  static const String multipartContentType = 'multipart/form-data';

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.data is Map<String, dynamic> || options.data is List<dynamic>) {
      // If the data being sent is JSON, set the content type accordingly
      options.headers['Content-Type'] = jsonContentType;
    } else if (options.data is FormData) {
      // If the data being sent is multipart form data, set the content type accordingly
      options.headers['Content-Type'] = multipartContentType;
    }

    super.onRequest(options, handler);
  }
}

Dio Api({bool? isFormData = false}) {
  final dio = Dio(); // With default `Options`.
  dio.options.baseUrl = "https://backend-production-be0d.up.railway.app/";

  var header = {
    'Accept': 'application/json',
    'x-device-type': 'mobile',
    "Authorization": 'Bearer ${UserToken.getToken()}',
  };

  dio.options.headers.addAll(header);

  dio.interceptors.add(ContentTypeInterceptor());

  return dio;
}
