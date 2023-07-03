import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playbox/app/controller/dashboard_controller.dart';
import 'package:playbox/utils/color_constants.dart';
import 'package:playbox/utils/text_styles.dart';
import 'package:playbox/widgets/app_bottombar.dart';
import 'package:playbox/widgets/app_dropdown.dart';
import 'package:playbox/widgets/dashboard/do_card.dart';
import 'package:playbox/widgets/dashboard/ph_card.dart';
import 'package:playbox/widgets/dashboard/salinity_card.dart';
import 'package:playbox/widgets/dashboard/temp_card.dart';
import 'package:sizer/sizer.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 50),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    child: Image.asset(
                      "assets/images/default_pp.png",
                      width: 44,
                      height: 44,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text("Selamat Pagi,"),
                        SizedBox(height: 2),
                        Text(
                          "Fadli Antarino",
                          style: h3TextStyle(weight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 12),
                  IconButton(
                    onPressed: () {},
                    color: Colors.white,
                    icon: Icon(
                      Icons.notifications_outlined,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
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
              SizedBox(height: 12),
              Row(
                children: [
                  SizedBox(
                    width: 35.w,
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
              SizedBox(height: 16),
              Row(
                children: [
                  SizedBox(
                    width: 35.w,
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
