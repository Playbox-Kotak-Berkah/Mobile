import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:playbox/routes/app_route.dart';
import 'package:playbox/utils/color_constants.dart';
import 'package:playbox/utils/text_styles.dart';
import 'package:sizer/sizer.dart';

class AppBottomBar extends StatefulWidget {
  const AppBottomBar({super.key});

  @override
  State<AppBottomBar> createState() => _AppBottomBarState();
}

class _AppBottomBarState extends State<AppBottomBar> {
  @override
  Widget build(BuildContext context) {
    var currentRoute = Get.currentRoute;

    return Container(
      width: 100.w,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          ColorConstants.shadow[1]!,
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  Get.toNamed(AppRoute.dashboard);
                },
                child: Column(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/dashboard.svg",
                      width: 28,
                      color: currentRoute == AppRoute.dashboard
                          ? ColorConstants.primary[400]
                          : ColorConstants.slate[400],
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Dashboard",
                      style: body6TextStyle(
                        size: 10,
                        color: currentRoute == AppRoute.dashboard
                            ? ColorConstants.primary[400]
                            : ColorConstants.slate[400],
                        weight: currentRoute == AppRoute.dashboard
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(AppRoute.kontrol);
                },
                child: Column(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/kontrol.svg",
                      width: 28,
                      color: currentRoute == AppRoute.kontrol
                          ? ColorConstants.primary[400]
                          : ColorConstants.slate[400],
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Kontrol",
                      style: body6TextStyle(
                        size: 10,
                        weight: currentRoute == AppRoute.kontrol
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: currentRoute == AppRoute.kontrol
                            ? ColorConstants.primary[400]
                            : ColorConstants.slate[400],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  SvgPicture.asset(
                    "assets/icons/marketplace.svg",
                    width: 28,
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Marketplace",
                    style: body6TextStyle(size: 10),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(AppRoute.profile);
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.person_outline,
                      size: 30,
                      color: currentRoute == AppRoute.profile
                          ? ColorConstants.primary[400]
                          : ColorConstants.slate[400],
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Profile",
                      style: body6TextStyle(
                        size: 10,
                        weight: currentRoute == AppRoute.profile
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: currentRoute == AppRoute.profile
                            ? ColorConstants.primary[400]
                            : ColorConstants.slate[400],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
