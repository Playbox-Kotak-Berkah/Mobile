import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playbox/routes/app_route.dart';
import 'package:playbox/utils/color_constants.dart';
import 'package:playbox/utils/text_styles.dart';

class SwitchUser extends StatelessWidget {
  final bool isFarmer;
  const SwitchUser({
    super.key,
    required this.isFarmer,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(
          isFarmer ? AppRoute.customerMarketplace : AppRoute.farmerMarketplace,
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Beralih ke Mode Pembeli",
              style: body5TextStyle(
                weight: FontWeight.w500,
                color: ColorConstants.primary[500],
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: ColorConstants.slate[300],
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}
