import 'package:flutter/material.dart';
import 'package:playbox/app/controller/dashboard_controller.dart';
import 'package:playbox/app/types/indicator_type.dart';
import 'package:playbox/partials/kontrol/card_indicator.dart';
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
      appBar: PreferredSize(
        preferredSize: Size(100.w, 80),
        child: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Column(
            children: [
              SizedBox(height: 50),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
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
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppDropdown(
                hintText: "Pilih Tambak",
                // prefixIcon: Icon(Icons.location_on_outlined),
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
                    child: CardIndicator(
                      type: Indicator.bulb,
                      active: false,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: CardIndicator(
                      type: Indicator.fan,
                      active: true,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: CardIndicator(
                      type: Indicator.water,
                      active: true,
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
