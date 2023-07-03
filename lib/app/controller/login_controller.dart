import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:playbox/app/models/login/login_model.dart';
import 'package:playbox/services/api/fetch_data.dart';
import 'package:playbox/services/api/request_method.dart';
import 'package:playbox/utils/form_converter.dart';

class LoginController extends GetxController {
  RxMap<String, TextEditingController> form = {
    "email": TextEditingController(),
    "password": TextEditingController(),
  }.obs;

  var formKey = GlobalKey<FormState>();

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

    return null;
  }

  void login() async {
    if (formKey.currentState!.validate()) {
      final data = formConverter(form);

      var response = await fetchData<LoginModel>(
          url: "api/farmer-login",
          data: jsonEncode(data),
          method: RequestMethod.POST);

      if (response != null) {
        print(response.data?.token);
      }
    }
  }
}
