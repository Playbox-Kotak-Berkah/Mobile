import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playbox/app/controller/dashboard_controller.dart';
import 'package:playbox/partials/dashboard/dashboard_appbar.dart';
import 'package:playbox/partials/dashboard/do_card.dart';
import 'package:playbox/partials/dashboard/ph_card.dart';
import 'package:playbox/partials/dashboard/salinity_card.dart';
import 'package:playbox/partials/dashboard/temp_card.dart';
import 'package:playbox/utils/color_constants.dart';
import 'package:playbox/utils/text_styles.dart';
import 'package:playbox/widgets/app_bottombar.dart';
import 'package:playbox/widgets/app_dropdown.dart';
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
    print(controller.farms);
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
                style: h1TextStyle(
                  color: ColorConstants.slate[800],
                  weight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                "Lihat kolam dengan parameter kualitas air di luar standar normal dan perkembangan produktivitas tambak pada siklus berjalan di halaman ini.",
                style: body6TextStyle(),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 16),
              Obx(
                () => AppDropdown(
                  hintText: "Pilih Tambak",
                  prefixIcon: Icons.location_on_outlined,
                  items: controller.farms
                      .map(
                        (element) => AppDropdownItem(
                            text: element.name,
                            value: int.parse('${element.id}')),
                      )
                      .toList(),
                  value: controller.farmId.value,
                  onChanged: (e) {
                    controller.farmId.value = e!;
                  },
                ),
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  SizedBox(
                    width: 30.w,
                    child: Text("Kolam yang Dipantau"),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: AppDropdown(
                      onChanged: (e) {
                        print(e);
                      },
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
              SizedBox(height: 16),
              Row(
                children: [
                  SizedBox(
                    width: 30.w,
                    child: Text("Pilih Siklus Kolam (Harian)"),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: AppDropdown(
                      hintText: "Tanggal",
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
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("DOC (Umur Siklus)"),
                    Text(
                      "20",
                      style: h1TextStyle(
                        color: ColorConstants.primary[500],
                        weight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: PhCard(
                      data: 7.1,
                      morning: 8.1,
                      afternoon: 7.9,
                      night: 7.8,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: TempCard(
                      data: 7.1,
                      morning: 8.1,
                      afternoon: 7.9,
                      night: 7.8,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: DoCard(
                      data: 7.1,
                      morning: 8.1,
                      afternoon: 7.9,
                      night: 7.8,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: SalinityCard(
                      data: 17,
                      morning: 19,
                      afternoon: 20,
                      night: 18,
                    ),
                  ),
                ],
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
