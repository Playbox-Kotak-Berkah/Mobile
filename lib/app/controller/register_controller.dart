import 'package:email_validator/email_validator.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  RxMap<String, TextEditingController> form = {
    "email": TextEditingController(),
    "name": TextEditingController(),
    "phone": TextEditingController(),
    "password": TextEditingController(),
  }.obs;

  TextEditingController confirmPassword = TextEditingController();

  String? confirmPasswordValidator(String? value) {
    if (value!.isEmpty) {
      return "Please enter your password";
    }
    if (value == form['password']!.text) {
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

  void register() {
    if (formKey.currentState!.validate()) {
      // TOOD: Add logic register here
    }
  }
}
