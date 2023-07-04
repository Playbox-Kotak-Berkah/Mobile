import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:playbox/utils/text_styles.dart';

class CardFilter extends StatefulWidget {
  const CardFilter({super.key});

  @override
  State<CardFilter> createState() => _CardFilterState();
}

class _CardFilterState extends State<CardFilter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 84,
            child: Column(
              children: [
                SvgPicture.asset("assets/icons/around_me.svg"),
                SizedBox(height: 4),
                Text(
                  "Sekitar Saya",
                  style: body6TextStyle(),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 84,
            child: Column(
              children: [
                SvgPicture.asset("assets/icons/promo.svg"),
                SizedBox(height: 4),
                Text(
                  "Promo",
                  style: body6TextStyle(),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 84,
            child: Column(
              children: [
                SvgPicture.asset("assets/icons/shrimp.svg"),
                SizedBox(height: 4),
                Text(
                  "Jaminan Segar",
                  style: body6TextStyle(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
