import 'package:get/get.dart';
import 'package:playbox/app/controller/global_controller.dart';

class ProfileController extends GetxController {
  static ProfileController get i => Get.find();

  @override
  void onInit() {
    super.onInit();
    GlobalController globalController = GlobalController.i;
    globalController.getProfileData();
  }
}
