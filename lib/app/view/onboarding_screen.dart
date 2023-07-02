import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playbox/app/controller/onboarding_controller.dart';
import 'package:playbox/utils/color_constants.dart';
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
            Image.asset(
              "assets/images/onboarding_1.png",
              width: 100.w,
              height: 75.h,
              fit: BoxFit.fill,
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: 100.w,
                height: 45.h,
                padding: const EdgeInsets.all(20),
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
                      children: [Text('Kelola Tambak dalam Satu Genggaman.')],
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
