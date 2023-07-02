import 'package:flutter/material.dart';
import 'package:playbox/utils/color_constants.dart';

ThemeData globalTheme() {
  return ThemeData(
    primaryColor: ColorConstants.primary[500],
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
        (states) => EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
      ),
      backgroundColor: MaterialStateProperty.resolveWith<Color?>(
        (states) {
          if (states.contains(MaterialState.hovered)) {
            return ColorConstants.primary[400];
          } else if (states.contains(MaterialState.pressed)) {
            return ColorConstants.primary[600];
          } else if (states.contains(MaterialState.disabled)) {
            return ColorConstants.slate[200];
          } else {
            return ColorConstants.primary[500];
          }
        },
      ),
    )),
  );
}
