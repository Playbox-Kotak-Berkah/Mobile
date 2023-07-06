import 'package:get/get.dart';
import 'package:playbox/app/models/profile/profile_model.dart';
import 'package:playbox/services/api/fetch_data.dart';
import 'package:playbox/services/api/request_method.dart';
import 'package:playbox/services/token/app_token.dart';

class GlobalController extends GetxController {
  static GlobalController get i => Get.find();

  Rxn<ProfileModel> profile = Rxn<ProfileModel>();

  Future<bool> getProfileData() async {
    var response = await fetchData<ProfileModel>(
      url: "api/farmer-profile",
      method: RequestMethod.GET,
    );

    if (response != null) {
      profile.value = response.data!;
      return true;
    } else {
      UserToken.clearToken();
      return false;
    }
  }
}
