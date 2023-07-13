import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:playbox/utils/color_constants.dart';
import 'package:playbox/utils/text_styles.dart';
import 'package:sizer/sizer.dart';

class InsertImage extends StatelessWidget {
  const InsertImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Insert Image",
          style: body5TextStyle(
            weight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 12),
        DottedBorder(
          color: ColorConstants.slate[300]!,
          borderType: BorderType.RRect,
          radius: Radius.circular(10),
          dashPattern: [6, 6],
          child: Container(
            width: 100.w,
            height: 140,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/icons/add.svg",
                  width: 35,
                ),
                SizedBox(height: 6),
                Text(
                  "Insert your image product",
                  style: body6TextStyle(
                    color: ColorConstants.slate[400],
                    weight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
