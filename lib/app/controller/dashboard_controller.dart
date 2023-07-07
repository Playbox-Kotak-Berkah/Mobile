import 'package:get/get.dart';
import 'package:playbox/app/models/farm/farm_model.dart';
import 'package:playbox/services/api/fetch_data.dart';
import 'package:playbox/services/api/request_method.dart';

class DashboardController extends GetxController {
  static DashboardController get i => Get.find();
  RxList<FarmModel> farms = <FarmModel>[].obs;

  void getAllFarm() async {
    var response = await fetchMultipleData<FarmModel>(
      url: "/api/farmer/tambak/all-tambak",
      method: RequestMethod.GET,
    );

    if (response != null) {
      farms.value = response.data!;
    }
  }

  RxInt farmId = (-1).obs;

  @override
  void onInit() {
    super.onInit();
    getAllFarm();
  }
}
