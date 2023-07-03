import 'package:flutter/material.dart';

class ColorConstants {
  static const slate = {
    25: Color(0xFFF9FAFB),
    50: Color(0xFFF0F3F9),
    100: Color(0xFFE9EFF7),
    200: Color(0xFFD7DFE9),
    300: Color(0xFFAFBACA),
    400: Color(0xFF8897AE),
    500: Color(0xFF5E718D),
    600: Color(0xFF455468),
    700: Color(0xFF3D4A5C),
    800: Color(0xFF2D3643),
    900: Color(0xFF1C222B),
  };

  // NOTE: currently UI doesn't have text style guides, so i made it by myself. Change it if text styles guide availables
  static const shadow = {
    1: BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.04),
      blurRadius: 10,
      spreadRadius: 10,
    ),
  };

  static const primary = {
    100: Color(0xffCFE0F4),
    200: Color(0xffA0C2E9),
    300: Color(0xff70A3DE),
    400: Color(0xff4185D3),
    500: Color(0xff1166C8),
    600: Color(0xff0E52A0),
    700: Color(0xff0A3D78),
    800: Color(0xff072950),
    900: Color(0xff031428),
  };

  static const error = Color(0xffFF574D);
}
