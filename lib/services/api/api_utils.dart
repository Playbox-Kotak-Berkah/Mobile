import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' hide Response hide FormData hide MultipartFile;
import 'package:playbox/app/controller/global_controller.dart';
import 'package:playbox/routes/app_route.dart';
import 'package:playbox/services/token/app_token.dart';

class ApiUtils {
  static void showAlert(String msg, {bool? isSuccess = false}) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: isSuccess! ? Colors.green : Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static void logout() {
    UserToken.clearToken();
    if (!Get.currentRoute.contains(AppRoute.splash)) {
      GlobalController controller = GlobalController.i;
      controller.profile.value = null;
      Get.offAllNamed(AppRoute.splash);
    }
  }
}
