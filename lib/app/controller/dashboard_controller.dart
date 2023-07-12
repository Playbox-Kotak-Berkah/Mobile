import 'package:get/get.dart';
import 'package:playbox/app/models/farm/farm_model.dart';
import 'package:playbox/app/models/pond/pond_model.dart';
import 'package:playbox/services/api/api_utils.dart';
import 'package:playbox/services/api/fetch_data.dart';
import 'package:playbox/services/api/request_method.dart';

class DashboardController extends GetxController {
  static DashboardController get i => Get.find();
  RxList<FarmModel> farms = <FarmModel>[].obs;
  RxList<PondModel> ponds = <PondModel>[].obs;

  Rxn<FarmModel> selectedFarm = Rxn<FarmModel>();
  Rxn<PondModel> selectedPond = Rxn<PondModel>();

  RxInt farmId = (-1).obs;
  RxInt pondId = (-1).obs;
  RxInt cycleId = (-1).obs;

  @override
  void onInit() async {
    super.onInit();
    getAllFarm();
  }

  Future getAllFarm() async {
    var response = await fetchMultipleData<FarmModel>(
      url: "/api/farmer/tambak/all-tambak",
      method: RequestMethod.GET,
    );

    if (response != null) {
      selectedPond.value = null;
      ponds.value = <PondModel>[];

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

  void createFarm(Map<String, String> data) async {
    var response = await fetchData<FarmModel>(
      url: "/api/farmer/tambak/add-tambak",
      method: RequestMethod.POST,
      data: data,
    );

    if (response != null) {
      ApiUtils.showAlert(
        "Berhasil membuat tambak",
        isSuccess: true,
      );
      getAllFarm();
      Get.back();
    }
  }

  void createPond(Map<String, String> data) async {
    final farmId = selectedFarm.value?.id;
    if (farmId == null) {
      ApiUtils.showAlert("Please select farm first");
      return;
    }

    var response = await fetchData<PondModel>(
      url: "/api/farmer/$farmId/add-kolam",
      method: RequestMethod.POST,
      data: data,
    );

    if (response != null) {
      ApiUtils.showAlert(
        "Berhasil menambahkan kolam",
        isSuccess: true,
      );

      getPond(farmId);
      Get.back();
    }
  }
}
