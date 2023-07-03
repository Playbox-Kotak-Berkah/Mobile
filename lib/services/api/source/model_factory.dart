import 'package:playbox/app/models/login/login_model.dart';
import 'package:playbox/app/models/register/register_model.dart';

abstract class ModelFactory {
  factory ModelFactory.fromJson(Type type, Map<String, dynamic> json) {
    final strType = type.toString().replaceAll("?", "");
    if (strType == (LoginModel).toString()) {
      return LoginModel.fromJson(json);
    } else if (strType == (RegisterModel).toString()) {
      return RegisterModel.fromJson(json);
    } else {
      throw UnimplementedError();
    }
  }
}
