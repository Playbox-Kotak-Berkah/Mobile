import 'package:get/get.dart';
import 'package:playbox/app/controller/kontrol_controller.dart';

class KontrolBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<KontrolController>(KontrolController());
  }
}
