import 'package:get/get.dart';
import 'package:playbox/app/models/product/product_model.dart';
import 'package:playbox/services/api/fetch_data.dart';
import 'package:playbox/services/api/request_method.dart';

class UserMarketplaceController extends GetxController {
  static UserMarketplaceController get i => Get.find();

  RxList<ProductModel> products = <ProductModel>[].obs;

  void getAllProducts() async {
    var response = await fetchMultipleData<ProductModel>(
      url: "/api/marketplace-user/all?page=1&limit=10",
      queryParameters: {"page": 1, "limit": 10},
      method: RequestMethod.GET,
    );

    if (response != null) {
      products.value = response.data ?? <ProductModel>[];
    }
  }

  @override
  void onInit() {
    super.onInit();
    getAllProducts();
  }
}
