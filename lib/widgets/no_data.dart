import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:playbox/utils/color_constants.dart';
import 'package:playbox/utils/text_styles.dart';

class NoData extends StatelessWidget {
  final void Function()? onPressed;
  const NoData({super.key, this.onPressed});

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
        Text(
          "Tidak ada data ditemukan",
          style: body4TextStyle(
            color: ColorConstants.slate[700],
            weight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 12),
        onPressed != null
            ? ElevatedButton(
                onPressed: () {},
                child: Text("Tambah Data"),
              )
            : Container(),
      ],
    );
  }
}
