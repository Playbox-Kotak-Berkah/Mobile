import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:playbox/utils/color_constants.dart';
import 'package:playbox/utils/text_styles.dart';
import 'package:playbox/widgets/app_bottombar.dart';
import 'package:playbox/widgets/app_dropdown.dart';
import 'package:sizer/sizer.dart';

class KontrolPage extends StatefulWidget {
  const KontrolPage({super.key});

  @override
  State<KontrolPage> createState() => _KontrolPageState();
}

class _KontrolPageState extends State<KontrolPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Kontrol Tambak",
                    style: body1TextStyle(weight: FontWeight.w600),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    onPressed: () {},
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.chat_bubble_outline_outlined,
                          color: ColorConstants.primary[500],
                          size: 16,
                        ),
                        SizedBox(width: 4),
                        Text(
                          "Konsultasi",
                          style: body5TextStyle(
                            color: ColorConstants.primary[500],
                            weight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              AppDropdown(
                hintText: "Pilih Tambak",
                prefixIcon: Icon(Icons.location_on_outlined),
                items: [
                  AppDropdownItem(text: 'Tambak 1 - Ben\'s Farm', value: 0),
                  AppDropdownItem(text: 'Tambak 2 - Fadli Farm', value: 1),
                  AppDropdownItem(text: 'Tambak 2 - Fadli Farm', value: 2),
                ],
                value: -1,
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  SizedBox(
                    width: 30.w,
                    child: Text("Kolam yang Dipantau"),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: AppDropdown(
                      hintText: "Pilih Kolam",
                      items: [
                        AppDropdownItem(
                            text: 'Tambak 1 - Ben\'s Farm', value: 0),
                        AppDropdownItem(
                            text: 'Tambak 2 - Fadli Farm', value: 1),
                        AppDropdownItem(
                            text: 'Tambak 2 - Fadli Farm', value: 2),
                      ],
                      value: -1,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            "assets/icons/bulb_blue.svg",
                            width: 45,
                            height: 45,
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Lampu Tambak",
                            style: body4TextStyle(
                              color: ColorConstants.slate[700],
                              weight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Mati",
                            style: body6TextStyle(
                                color: ColorConstants.slate[400]),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: ColorConstants.primary[500],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            "assets/icons/fan_white.svg",
                            width: 45,
                            height: 45,
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Kincir Air",
                            style: body4TextStyle(
                              color: Colors.white,
                              weight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Mati",
                            style: body6TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            "assets/icons/water_blue.svg",
                            width: 45,
                            height: 45,
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Kran Air",
                            style: body4TextStyle(
                              color: ColorConstants.slate[700],
                              weight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Mati",
                            style: body6TextStyle(
                                color: ColorConstants.slate[400]),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Container(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AppBottomBar(),
    );
  }
}
