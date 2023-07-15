import 'package:get/get.dart';
import 'package:playbox/app/controller/global_controller.dart';
import 'package:playbox/app/controller/profile_controller.dart';
import 'package:playbox/app/models/profile/profile_model.dart';

class EditProfileController extends GetxController {
  static EditProfileController get i => Get.find();

  Rxn<ProfileModel> profile = Rxn<ProfileModel>();

  @override
  void onInit() {
    super.onInit();
    GlobalController globalController = GlobalController.i;
    profile.value = globalController.profile.value;
  }
}
