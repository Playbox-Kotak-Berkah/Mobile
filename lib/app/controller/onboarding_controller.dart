import 'package:get/get.dart';

class OnboardingController extends GetxController {
  static OnboardingController get i => Get.find();

  RxInt current = 1.obs;
  RxBool isMax = false.obs;
  RxBool isMin = true.obs;

  Map<int, String> title = {
    1: "Kelola Tambak dalam Satu Genggaman.",
    2: "Lihat Perkembangan Tambak Anda.",
    3: "Bergabunglah Jadi Smart Aqua Farmer Sekarang!"
  };

  final caption = {
    1: "Kini mengelola seluruh tambak anda tidak perlu repot datang ke tambak. Kendalikan seluruhnya dalam genggaman anda. ",
    2: "Pantau data tambak Anda dan lihat perkembangan nya secara realtime.",
    3: "Kendalikan seluruhnya dari genggaman Anda.",
  };

  void next() {
    if (!isMax.value) {
      current.value++;
      if (current.value == 3) {
        isMax.value = true;
      }
      isMin.value = false;
    }
  }

  void register() {
    // TODO: Redirect to Register Screnn
  }

  void login() {
    // TODO: Redirect to Login Screen
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
