import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:playbox/utils/color_constants.dart';
import 'package:playbox/utils/text_styles.dart';

class HelpCenter extends StatelessWidget {
  const HelpCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Help Center',
          style: body4TextStyle(
            weight: FontWeight.w800,
          ),
        ),
        SizedBox(height: 8),
        Container(
          padding: EdgeInsets.symmetric(vertical: 9, horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    children: [
                      Icon(
                        Icons.headset_mic,
                        size: 15,
                      ),
                      SizedBox(width: 18),
                      Expanded(
                        child: Text(
                          'Customer Help Center',
                          style: body6TextStyle(
                            weight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Icon(Icons.chevron_right, size: 20),
                    ],
                  ),
                ),
              ),
              Divider(
                thickness: 1,
                color: ColorConstants.slate[400],
                height: 5,
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/faq.svg",
                        width: 15,
                      ),
                      SizedBox(width: 18),
                      Expanded(
                        child: Text(
                          'Frequently Asked Question',
                          style: body6TextStyle(
                            weight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Icon(Icons.chevron_right, size: 20),
                    ],
                  ),
                ),
              ),
              Divider(
                thickness: 1,
                color: ColorConstants.slate[400],
                height: 5,
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    children: [
                      Icon(
                        Icons.language,
                        size: 15,
                      ),
                      SizedBox(width: 18),
                      Expanded(
                        child: Text(
                          'Change Language',
                          style: body6TextStyle(
                            weight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Icon(Icons.chevron_right, size: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
