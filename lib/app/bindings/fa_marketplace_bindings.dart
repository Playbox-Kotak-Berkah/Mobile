import 'package:get/get.dart';
import 'package:playbox/app/controller/fa_marketplace_controller.dart';

class FarmerMarketplaceBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FarmerMarketplaceController>(
        () => FarmerMarketplaceController());
  }
}
