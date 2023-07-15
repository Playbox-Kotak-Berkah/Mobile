import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:playbox/utils/color_constants.dart';
import 'package:playbox/utils/text_styles.dart';
import 'package:sizer/sizer.dart';

class NoData extends StatelessWidget {
  final void Function()? onPressed;
  final String action;
  final String text;

  const NoData({
    super.key,
    this.onPressed,
    this.action = "Tambah Data",
    this.text = "Tidak ada data ditemukan",
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          "assets/icons/no_data.svg",
        ),
        SizedBox(height: 12),
        SizedBox(
          width: 65.w,
          child: Text(
            text,
            style: body5TextStyle(
              color: ColorConstants.slate[700],
              weight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 12),
        onPressed != null
            ? ElevatedButton(
                onPressed: onPressed,
                child: Text(action),
              )
            : Container(),
      ],
    );
  }
}
