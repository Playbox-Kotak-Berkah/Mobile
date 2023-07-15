import 'package:get/get.dart';
import 'package:playbox/app/controller/edit_profile_controller.dart';

class EditProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<EditProfileController>(EditProfileController());
  }
}
