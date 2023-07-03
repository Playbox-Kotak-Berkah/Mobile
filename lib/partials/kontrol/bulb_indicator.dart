import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:playbox/utils/color_constants.dart';
import 'package:playbox/utils/text_styles.dart';

class BulbIndicator extends StatefulWidget {
  const BulbIndicator({super.key});

  @override
  State<BulbIndicator> createState() => _BulbIndicatorState();
}

class _BulbIndicatorState extends State<BulbIndicator> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              "assets/icons/bulb_blue.svg",
              width: 45,
              height: 45,
            ),
            SizedBox(height: 8),
            Text(
              "Lampu Tambak",
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
      ),
    );
  }
}
