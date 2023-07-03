import 'package:flutter/material.dart';
import 'package:playbox/utils/color_constants.dart';
import 'package:playbox/utils/text_styles.dart';

class DoCard extends StatelessWidget {
  final num? data;
  final num? morning;
  final num? afternoon;
  final num? night;

  const DoCard({
    super.key,
    this.data,
    this.morning,
    this.afternoon,
    this.night,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Wrap(
                  direction: Axis.horizontal,
                  children: [
                    Text(
                      "DO (ppm)",
                      style: body6TextStyle(),
                    ),
                    Text(
                      "(Realtime)",
                      style: body6TextStyle(
                        color: ColorConstants.primary[500],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(width: 12),
              Text(
                "${data ?? "-"}",
                style: h1TextStyle(
                  color: ColorConstants.primary[500],
                  weight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Divider(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "DO (Pagi)",
                style: body6TextStyle(),
              ),
              Text(
                "${morning ?? "-"}",
                style: body6TextStyle(
                  color: ColorConstants.primary[500],
                  weight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "DO (Siang)",
                style: body6TextStyle(),
              ),
              Text(
                "${afternoon ?? "-"}",
                style: body6TextStyle(
                  color: ColorConstants.primary[500],
                  weight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "DO (Malam)",
                style: body6TextStyle(),
              ),
              Text(
                "${night ?? "-"}",
                style: body6TextStyle(
                  color: ColorConstants.primary[500],
                  weight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
