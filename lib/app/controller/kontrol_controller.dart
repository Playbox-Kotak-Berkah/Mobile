import 'package:get/get.dart';
import 'package:playbox/app/controller/dashboard_controller.dart';
import 'package:playbox/app/models/farm/farm_model.dart';
import 'package:playbox/app/models/pond/pond_model.dart';
import 'package:playbox/services/api/fetch_data.dart';
import 'package:playbox/services/api/request_method.dart';

class KontrolController extends GetxController {
  static get i => Get.find<KontrolController>();

  RxList<FarmModel> farms = <FarmModel>[].obs;
  RxList<PondModel> ponds = <PondModel>[].obs;

  Rxn<FarmModel> selectedFarm = Rxn<FarmModel>();
  Rxn<PondModel> selectedPond = Rxn<PondModel>();

  @override
  void onInit() {
    super.onInit();

    DashboardController dashboardController = DashboardController.i;
    farms.value = dashboardController.farms;
    getAllFarm();
  }

  Future getAllFarm() async {
    var response = await fetchMultipleData<FarmModel>(
      url: "/api/farmer/tambak/all-tambak",
      method: RequestMethod.GET,
    );

    if (response != null) {
      var copyResponse = response.data?.asMap().entries.map((e) {
        var copy = e.value;
        copy.name = "Tambak ${e.key + 1} - ${copy.name}";
        return copy;
      }).toList();

      farms.value = copyResponse ?? [];
    }
  }

  void getPond(int farmId) async {
    var response = await fetchMultipleData<PondModel>(
      url: "/api/farmer/$farmId/all-kolam",
      method: RequestMethod.GET,
    );

    if (response != null) {
      selectedPond.value = null;
      ponds.value = <PondModel>[];
      ponds.value = response.data ?? [];
    }
  }
}
