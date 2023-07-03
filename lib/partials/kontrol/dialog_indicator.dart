import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:playbox/app/types/indicator_type.dart';
import 'package:playbox/utils/color_constants.dart';
import 'package:playbox/utils/text_styles.dart';
import 'package:sizer/sizer.dart';

class DialogIndicator extends StatelessWidget {
  final Indicator type;
  final bool active;
  const DialogIndicator({
    super.key,
    required this.type,
    required this.active,
  });

  String getIndicatorName() {
    String indicatorName;

    switch (type) {
      case Indicator.bulb:
        indicatorName = "Lampu tambak";
        break;
      case Indicator.fan:
        indicatorName = "Kincir air";
        break;
      case Indicator.water:
        indicatorName = "Kran air";
        break;
      default:
        indicatorName =
            "Unknown"; // Provide a default case to handle any other values
        break;
    }

    return indicatorName;
  }

  @override
  Widget build(BuildContext context) {
    String color = active ? "blue" : "grey";
    String kondisi = active ? "hidup" : "mati";
    String action = active ? "mematikan" : "menghidupkan";
    String indicator = getIndicatorName();

    return Dialog(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Builder(builder: (context) {
              switch (type) {
                case Indicator.bulb:
                  return SvgPicture.asset(
                    "assets/icons/bulb_$color.svg",
                    width: 30.w,
                  );
                case Indicator.fan:
                  return SvgPicture.asset(
                    "assets/icons/fan_$color.svg",
                    width: 30.w,
                  );
                case Indicator.water:
                  return SvgPicture.asset(
                    "assets/icons/water_$color.svg",
                    width: 30.w,
                  );
              }
            }),
            SizedBox(height: 16),
            Text(
              "$indicator dalam kondisi $kondisi,\nanda yakin akan $action?",
              textAlign: TextAlign.center,
              style: body4TextStyle(
                color: ColorConstants.slate[700],
                weight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorConstants.slate[200],
                    ),
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      "Batal",
                      style: body5TextStyle(
                        weight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text("Batal"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
