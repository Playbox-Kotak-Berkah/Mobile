import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:playbox/app/controller/dashboard_controller.dart';
import 'package:playbox/app/controller/kontrol_controller.dart';
import 'package:playbox/partials/kontrol/kontrol_card.dart';
import 'package:playbox/partials/kontrol/kontrol_selector.dart';
import 'package:playbox/utils/color_constants.dart';
import 'package:playbox/utils/text_styles.dart';
import 'package:playbox/widgets/app_bottombar.dart';
import 'package:playbox/widgets/no_data.dart';
import 'package:sizer/sizer.dart';

class KontrolPage extends StatefulWidget {
  const KontrolPage({super.key});

  @override
  State<KontrolPage> createState() => _KontrolPageState();
}

class _KontrolPageState extends State<KontrolPage> {
  DashboardController dashboardController = DashboardController.i;
  KontrolController controller = KontrolController.i;

  @override
  void initState() {
    super.initState();
    dashboardController.getAllFarm();
  }

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
              KontrolSelector(),
              SizedBox(height: 20),
              Obx(
                () => controller.selectedPond.value != null
                    ? KontrolCard()
                    : SizedBox(
                        height: 50.h,
                        child: NoData(),
                      ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AppBottomBar(),
    );
  }
}
