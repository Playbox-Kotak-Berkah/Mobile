import 'package:flutter/material.dart';
import 'package:playbox/utils/color_constants.dart';
import 'package:playbox/utils/text_styles.dart';

class SwitchUser extends StatelessWidget {
  const SwitchUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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
    );
  }
}
