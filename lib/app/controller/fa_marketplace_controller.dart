import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:playbox/app/models/product/product_model.dart';
import 'package:playbox/services/api/fetch_data.dart';
import 'package:playbox/services/api/request_method.dart';

class FarmerMarketplaceController extends GetxController {
  static FarmerMarketplaceController get i => Get.find();
  RxList<ProductModel> myProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getAllProduct();
  }

  void getAllProduct() async {
    final box = GetStorage();
    final tempData = box.read("my_products");
    if (tempData.runtimeType == List<ProductModel>) {
      myProducts.value = tempData;
    }

    var response = await fetchMultipleData<ProductModel>(
      url: "/api/market-farmer/all",
      method: RequestMethod.GET,
    );

    if (response != null) {
      myProducts.value = response.data!;
      box.write("my_products", response.data);
    }
  }
}
