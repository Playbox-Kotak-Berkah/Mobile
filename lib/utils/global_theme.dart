import 'package:flutter/material.dart';
import 'package:playbox/utils/color_constants.dart';
import 'package:playbox/utils/text_styles.dart';

ThemeData globalTheme() {
  return ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: ColorConstants.slate[50],
      elevation: 0,
    ),
    primaryColor: ColorConstants.primary[500],
    scaffoldBackgroundColor: ColorConstants.slate[50],
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
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      isDense: true,
      errorStyle: TextStyle(
        fontSize: 11,
      ),
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: ColorConstants.slate[200]!,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 1.25,
          color: ColorConstants.primary[400]!,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 1.5,
          color: Color(0xFFFF0000),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: Color(0xFFFF0000),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      labelStyle: body4TextStyle(
        size: 15,
        color: ColorConstants.slate[800],
        weight: FontWeight.w500,
      ),
      floatingLabelStyle: body4TextStyle(height: 0.9),
    ),
  );
}
