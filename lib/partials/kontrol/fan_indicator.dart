import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:playbox/utils/color_constants.dart';
import 'package:playbox/utils/text_styles.dart';

class FanIndicator extends StatefulWidget {
  const FanIndicator({super.key});

  @override
  State<FanIndicator> createState() => _FanIndicatorState();
}

class _FanIndicatorState extends State<FanIndicator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: ColorConstants.primary[500],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            "assets/icons/fan_white.svg",
            width: 45,
            height: 45,
          ),
          SizedBox(height: 8),
          Text(
            "Kincir Air",
            style: body4TextStyle(
              color: Colors.white,
              weight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4),
          Text(
            "Mati",
            style: body6TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
