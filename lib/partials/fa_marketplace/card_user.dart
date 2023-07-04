import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:playbox/utils/color_constants.dart';
import 'package:playbox/utils/text_styles.dart';

class CardUser extends StatelessWidget {
  const CardUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              ClipRRect(
                child: Image.asset(
                  "assets/images/default_pp.png",
                  width: 44,
                  height: 44,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Box Farm",
                    style: body4TextStyle(
                      weight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'aquamarket.id/shop/boxfarm',
                        style: body6TextStyle(
                          color: ColorConstants.slate[500],
                          weight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.copy,
                        color: ColorConstants.slate[500],
                        size: 12,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Icon(
            Icons.chevron_right,
            size: 24,
            color: ColorConstants.slate[300],
          ),
        ],
      ),
    );
  }
}
