import 'package:playbox/app/models/login/login_model.dart';

abstract class ModelFactory {
  factory ModelFactory.fromJson(Type type, Map<String, dynamic> json) {
    final strType = type.toString().replaceAll("?", "");
    if (strType == (LoginModel).toString()) {
      return LoginModel.fromJson(json);
    } else {
      throw UnimplementedError();
    }
  }
}
