import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Timer(const Duration(seconds: 3), () {
        // TODO: Redirect to onboarding screen
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: 100.h,
            width: 100.w,
            child: Image.asset(
              "assets/images/bg_splash.png",
              width: 100.w,
              height: 100.h,
              fit: BoxFit.fill,
            ),
          ),
          Center(
            child: Image.asset("assets/logo/logo_text_white.png"),
          ),
        ],
      ),
    );
  }
}
