import 'package:playbox/app/models/cycle/cycle_model.dart';
import 'package:playbox/app/models/farm/farm_model.dart';
import 'package:playbox/app/models/login/login_model.dart';
import 'package:playbox/app/models/pond/pond_model.dart';
import 'package:playbox/app/models/product/product_model.dart';
import 'package:playbox/app/models/profile/profile_model.dart';
import 'package:playbox/app/models/register/register_model.dart';

abstract class ModelFactory {
  factory ModelFactory.fromJson(Type type, Map<String, dynamic> json) {
    final strType = type.toString().replaceAll("?", "");
    if (strType == (LoginModel).toString()) {
      return LoginModel.fromJson(json);
    } else if (strType == (RegisterModel).toString()) {
      return RegisterModel.fromJson(json);
    } else if (strType == (ProfileModel).toString()) {
      return ProfileModel.fromJson(json);
    } else if (strType == (FarmModel).toString()) {
      return FarmModel.fromJson(json);
    } else if (strType == (PondModel).toString()) {
      return PondModel.fromJson(json);
    } else if (strType == (CycleModel).toString()) {
      return CycleModel.fromJson(json);
    } else if (strType == (ProductModel).toString()) {
      return ProductModel.fromJson(json);
    } else {
      throw UnimplementedError();
    }
  }
}
