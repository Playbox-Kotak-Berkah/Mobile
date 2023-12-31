import 'package:flutter/material.dart';
import 'package:playbox/utils/text_styles.dart';
import 'package:sizer/sizer.dart';

PreferredSizeWidget CustomAppBar({required String title, Widget? action}) {
  return PreferredSize(
    preferredSize: Size(100.w, 70),
    child: AppBar(
      automaticallyImplyLeading: false,
      flexibleSpace: Column(
        children: [
          SizedBox(height: 50),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: h2TextStyle(
                    weight: FontWeight.bold,
                  ),
                ),
                action ?? Container(),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
