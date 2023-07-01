import 'package:get/get.dart';

class OnboardingController extends GetxController {
  static OnboardingController get i => Get.find();

  RxInt current = 1.obs;
  RxBool isMax = false.obs;
  RxBool isMin = true.obs;

  void next() {
    if (!isMax.value) {
      current.value++;
      if (current.value == 3) {
        isMax.value = true;
      }
      isMin.value = false;
    }
  }

  void back() {
    if (!isMin.value) {
      current.value--;
      if (current.value == 1) {
        isMin.value = true;
      }
      isMax.value = false;
    }
  }
}
