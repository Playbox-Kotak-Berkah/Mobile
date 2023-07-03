import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:playbox/utils/color_constants.dart';
import 'package:playbox/utils/text_styles.dart';

class WaterIndicator extends StatefulWidget {
  const WaterIndicator({super.key});

  @override
  State<WaterIndicator> createState() => _WaterIndicatorState();
}

class _WaterIndicatorState extends State<WaterIndicator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            "assets/icons/water_blue.svg",
            width: 45,
            height: 45,
          ),
          SizedBox(height: 8),
          Text(
            "Kran Air",
            style: body4TextStyle(
              color: ColorConstants.slate[700],
              weight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4),
          Text(
            "Mati",
            style: body6TextStyle(color: ColorConstants.slate[400]),
          ),
        ],
      ),
    );
  }
}
