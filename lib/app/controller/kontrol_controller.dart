import 'package:get/get.dart';
import 'package:playbox/app/controller/dashboard_controller.dart';
import 'package:playbox/app/models/farm/farm_model.dart';
import 'package:playbox/app/models/pond/pond_model.dart';
import 'package:playbox/services/api/api_utils.dart';
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

  void editState({
    bool? water,
    bool? bulb,
    bool? fan,
  }) async {
    if (selectedFarm.value == null) {
      ApiUtils.showAlert("Please select farm first");
      return;
    }
    if (selectedPond.value == null) {
      ApiUtils.showAlert("Please select pond first");
      return;
    }

    var params = <String, bool>{};
    params.addIf(water != null, 'water', water ?? false);
    params.addIf(bulb != null, 'bulb', bulb ?? false);
    params.addIf(fan != null, 'fan', fan ?? false);

    var response = await fetchData<PondModel>(
      url: "/api/farmer/${selectedFarm.value!.id}/${selectedPond.value!.id}",
      queryParameters: params,
      method: RequestMethod.POST,
    );

    if (response != null) {
      selectedPond.value = response.data!;
      ApiUtils.showAlert(
        "Update state kontrol success",
        isSuccess: true,
      );
      Get.back();
    }
  }

  void getDetailPond() async {
    if (selectedFarm.value == null) {
      ApiUtils.showAlert("Please select farm first");
      return;
    }
    if (selectedPond.value == null) {
      ApiUtils.showAlert("Please select pond first");
      return;
    }

    var response = await fetchData<PondModel>(
      url: "/api/farmer/${selectedFarm.value!.id}/${selectedPond.value!.id}",
      method: RequestMethod.GET,
    );

    if (response != null) {
      selectedPond.value = response.data!;
    }
  }
}
