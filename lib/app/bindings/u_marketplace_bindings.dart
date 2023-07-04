import 'package:get/get.dart';
import 'package:playbox/app/controller/u_marketplace_controller.dart';

class UserMarketplaceBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserMarketplaceController>(() => UserMarketplaceController());
  }
}
