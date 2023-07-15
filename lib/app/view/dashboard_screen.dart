import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playbox/app/controller/dashboard_controller.dart';
import 'package:playbox/partials/dashboard/dashboard_appbar.dart';
import 'package:playbox/partials/dashboard/dashboard_card.dart';
import 'package:playbox/partials/dashboard/dashboard_selector.dart';
import 'package:playbox/partials/dashboard/do_card.dart';
import 'package:playbox/partials/dashboard/farm_dialog.dart';
import 'package:playbox/partials/dashboard/ph_card.dart';
import 'package:playbox/partials/dashboard/salinity_card.dart';
import 'package:playbox/partials/dashboard/temp_card.dart';
import 'package:playbox/utils/color_constants.dart';
import 'package:playbox/utils/date_calculate.dart';
import 'package:playbox/utils/text_styles.dart';
import 'package:playbox/widgets/app_bottombar.dart';
import 'package:playbox/widgets/app_dropdown.dart';
import 'package:playbox/widgets/no_data.dart';
import 'package:sizer/sizer.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  DashboardController controller = DashboardController.i;
  var a = DateTime.now();

  @override
  void initState() {
    super.initState();
    controller.getAllFarm();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(100.w, 80),
        child: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: ColorConstants.slate[50],
          flexibleSpace: DashboardAppbar(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 12),
              Text(
                "Dashboard",
                style: h2TextStyle(
                  color: ColorConstants.slate[800],
                  weight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Obx(
                () => controller.farms.isEmpty
                    ? SizedBox(
                        height: 70.h,
                        child: NoData(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => FarmDialog(),
                            );
                          },
                          action: "Buat Tambak",
                          text: "Tambakmu kosong\nBuat tambakmu dulu yuk 😁",
                        ),
                      )
                    : Column(
                        children: [
                          Text(
                            "Lihat kolam dengan parameter kualitas air di luar standar normal dan perkembangan produktivitas tambak pada siklus berjalan di halaman ini.",
                            style: body6TextStyle(),
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(height: 16),
                          DashboardSelector(),
                          SizedBox(height: 20),
                          Obx(
                            () => controller.selectedCycle.value == null
                                ? Container()
                                : Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 12),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("DOC (Umur Siklus)"),
                                        Text(
                                          "${dateCalculate(controller.selectedCycle.value!.start_date)}",
                                          style: h1TextStyle(
                                            color: ColorConstants.primary[500],
                                            weight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                            height: 200,
                            child: NoData(
                              text: "Input siklus kolam terlebih dahulu",
                            ),
                          ),
                          // DasboardCard(),
                        ],
                      ),
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AppBottomBar(),
    );
  }
}
