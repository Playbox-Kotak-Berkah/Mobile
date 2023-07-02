// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playbox/utils/color_constants.dart';
import 'package:playbox/utils/text_styles.dart';

class AppTextfield extends StatelessWidget {
  String label;
  TextEditingController controller;
  String? Function(String?)? validator;
  String placeholder;
  void Function(String)? onChange;
  TextInputType? keyboardType = TextInputType.text;
  int maxLines = 1;
  Color? labelColor;
  Widget? prefixIcon;
  Widget? prefix;
  bool obscureText = false;

  AppTextfield({
    super.key,
    required this.label,
    required this.controller,
    required this.placeholder,
    this.onChange,
    this.validator,
    this.keyboardType,
    this.maxLines = 1,
    this.labelColor,
    this.prefixIcon,
    this.prefix,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: body5TextStyle(
            weight: FontWeight.w500,
            color: labelColor,
          ),
        ),
        SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: placeholder,
              filled: true,
              fillColor: ColorConstants.slate[100],
              prefixIcon: prefixIcon,
              hintStyle: body5TextStyle(
                color: ColorConstants.slate[400],
              ),
              prefix: prefix,
            ),
            textAlignVertical: prefixIcon != null
                ? TextAlignVertical.center
                : TextAlignVertical.top,
            controller: controller,
            style: body5TextStyle(weight: FontWeight.w500),
            onChanged: onChange,
            validator: validator,
            keyboardType: keyboardType,
            maxLines: maxLines,
            obscureText: obscureText,
          ),
        ),
      ],
    );
  }
}
