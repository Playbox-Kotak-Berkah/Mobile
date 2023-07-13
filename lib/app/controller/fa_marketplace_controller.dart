import 'package:get/get.dart';
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
    var response = await fetchMultipleData<ProductModel>(
      url: "/api/market-farmer/all",
      method: RequestMethod.GET,
    );

    if (response != null) {
      myProducts.value = response.data!;
    }
  }
}
