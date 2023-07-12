import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:playbox/app/types/indicator_type.dart';
import 'package:playbox/partials/kontrol/dialog_indicator.dart';
import 'package:playbox/utils/color_constants.dart';
import 'package:playbox/utils/text_styles.dart';

class CardIndicator extends StatefulWidget {
  final Indicator type;
  final bool active;
  const CardIndicator({
    super.key,
    required this.type,
    required this.active,
  });

  @override
  State<CardIndicator> createState() => _CardIndicatorState();
}

class _CardIndicatorState extends State<CardIndicator> {
  @override
  Widget build(BuildContext context) {
    String color = widget.active ? "white" : "blue";

    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => DialogIndicator(
            type: widget.type,
            active: widget.active,
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: widget.active ? ColorConstants.primary[500] : Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Builder(builder: (context) {
              switch (widget.type) {
                case Indicator.bulb:
                  return SvgPicture.asset(
                    "assets/icons/bulb_$color.svg",
                    width: 45,
                    height: 45,
                  );
                case Indicator.fan:
                  return SvgPicture.asset(
                    "assets/icons/fan_$color.svg",
                    width: 45,
                    height: 45,
                  );
                case Indicator.water:
                  return SvgPicture.asset(
                    "assets/icons/water_$color.svg",
                    width: 45,
                    height: 45,
                  );
              }
            }),
            SizedBox(height: 8),
            Builder(builder: (context) {
              switch (widget.type) {
                case Indicator.bulb:
                  return Text(
                    "Lampu Tambak",
                    style: body4TextStyle(
                      color: !widget.active
                          ? ColorConstants.slate[700]
                          : Colors.white,
                      weight: FontWeight.w600,
                    ),
                  );

                case Indicator.fan:
                  return Text(
                    "Kincir Air",
                    style: body4TextStyle(
                      color: !widget.active
                          ? ColorConstants.slate[700]
                          : Colors.white,
                      weight: FontWeight.w600,
                    ),
                  );

                case Indicator.water:
                  return Text(
                    "Kran Air",
                    style: body4TextStyle(
                      color: !widget.active
                          ? ColorConstants.slate[700]
                          : Colors.white,
                      weight: FontWeight.w600,
                    ),
                  );
              }
            }),
            SizedBox(height: 2),
            Text(
              widget.active ? "Hidup" : "Mati",
              style: body6TextStyle(
                color: ColorConstants.slate[widget.active ? 100 : 400],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
