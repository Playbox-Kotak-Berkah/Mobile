import 'package:get/get.dart';
import 'package:playbox/app/controller/edit_product_controller.dart';

class EditProductBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<EditProductController>(EditProductController());
  }
}
