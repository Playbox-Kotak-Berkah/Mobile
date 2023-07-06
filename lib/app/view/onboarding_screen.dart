import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playbox/app/controller/onboarding_controller.dart';
import 'package:playbox/utils/color_constants.dart';
import 'package:playbox/utils/text_styles.dart';
import 'package:sizer/sizer.dart';

class OnboardingScreen extends GetView<OnboardingController> {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: 100.w,
        height: 100.h,
        child: Stack(
          children: [
            Obx(
              () => Image.asset(
                "assets/images/onboarding_${controller.current.value}.png",
                width: 100.w,
                height: 75.h,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: 100.w,
                height: 45.h,
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: ColorConstants.slate[25],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    ColorConstants.shadow[1]!,
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Obx(
                          () => Text(
                            controller.title[controller.current.value]!,
                            style: h1TextStyle(
                              color: ColorConstants.primary[500],
                              weight: FontWeight.w800,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Obx(
                          () => Text(
                            controller.caption[controller.current.value]!,
                            style: body5TextStyle(
                                color: ColorConstants.slate[700]),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Obx(
                          () => controller.current.value != 1
                              ? ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: const Size.fromHeight(40),
                                    backgroundColor: ColorConstants.slate[100],
                                  ),
                                  onPressed: controller.back,
                                  child: Text(
                                    'Kembali',
                                    style: body5TextStyle(
                                      color: ColorConstants.slate[700],
                                      weight: FontWeight.w600,
                                    ),
                                  ),
                                )
                              : Container(),
                        ),
                        SizedBox(height: 16),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(40), // NEW
                          ),
                          onPressed: () {
                            controller.current.value != 3
                                ? controller.next()
                                : controller.register(context);
                          },
                          child: Obx(() => controller.current.value == 3
                              ? Text('Gabung Sekarang')
                              : Text('Selanjutnya')),
                        ),
                        Obx(
                          () => controller.current.value == 3
                              ? Column(
                                  children: [
                                    SizedBox(height: 16),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("Sudah punya akun?"),
                                        SizedBox(width: 5),
                                        InkWell(
                                          onTap: controller.login,
                                          child: Text(
                                            "Masuk",
                                            style: body5TextStyle(
                                              weight: FontWeight.bold,
                                              color:
                                                  ColorConstants.primary[400],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              : Container(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
