import 'package:get/get.dart';
import 'package:playbox/app/controller/global_controller.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GlobalController());
  }
}
