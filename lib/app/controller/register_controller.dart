import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:playbox/app/models/login/login_model.dart';
import 'package:playbox/app/models/register/register_model.dart';
import 'package:playbox/routes/app_route.dart';
import 'package:playbox/services/api/api_utils.dart';
import 'package:playbox/services/api/fetch_data.dart';
import 'package:playbox/services/api/request_method.dart';
import 'package:playbox/services/token/app_token.dart';
import 'package:playbox/utils/form_converter.dart';

class RegisterController extends GetxController {
  RxMap<String, TextEditingController> form = {
    "email": TextEditingController(),
    "name": TextEditingController(),
    "phone": TextEditingController(),
    "password": TextEditingController(),
    "confirm_password": TextEditingController(),
  }.obs;

  TextEditingController confirmPassword = TextEditingController();

  String? confirmPasswordValidator(String? value) {
    if (value!.isEmpty) {
      return "Please enter your password";
    }
    if (value != form['password']!.text) {
      return "Konfirmasi password salah";
    }

    return null;
  }

  RxBool isAgree = false.obs;

  final formKey = GlobalKey<FormState>();

  String? emailValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please enter your Email';
    }

    if (!EmailValidator.validate(value)) {
      return "Email is not valid";
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 8) {
      return "Password must be length at least 8 character";
    }
    return null;
  }

  String? nameValidator(String? value) {
    if (value!.isEmpty) {
      return "Please enter your name";
    }
    return null;
  }

  void register() async {
    if (formKey.currentState!.validate()) {
      final data = formConverter(form);

      var response = await fetchData<RegisterModel>(
          url: "api/farmer-register",
          data: jsonEncode(data),
          method: RequestMethod.POST);

      if (response != null) {
        login();
      }
    }
  }

  void login() async {
    final formCopy = <String, TextEditingController>{
      "email": form['email']!,
      "password": form['password']!,
    };

    final data = formConverter(formCopy);

    var response = await fetchData<LoginModel>(
        url: "api/farmer-login",
        data: jsonEncode(data),
        method: RequestMethod.POST);

    if (response != null) {
      UserToken.setToken(response.data!.token);
      ApiUtils.showAlert("Login success", isSuccess: true);
      Get.toNamed(AppRoute.dashboard);
    }
  }
}
