import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:playbox/app/controller/dashboard_controller.dart';
import 'package:playbox/widgets/app_dropdown.dart';
import 'package:sizer/sizer.dart';

class KontrolSelector extends StatefulWidget {
  const KontrolSelector({super.key});

  @override
  State<KontrolSelector> createState() => _KontrolSelectorState();
}

class _KontrolSelectorState extends State<KontrolSelector> {
  DashboardController dashboardController = DashboardController.i;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => AppDropdown(
            hintText: "Pilih Tambak",
            prefixIcon: Icons.location_on_outlined,
            items: [
              ...dashboardController.farms
                  .map(
                    (element) => AppDropdownItem(
                        text: element.name, value: int.parse('${element.id}')),
                  )
                  .toList(),
            ],
            value: -1,
          ),
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
                  AppDropdownItem(text: 'Tambak 1 - Ben\'s Farm', value: 0),
                  AppDropdownItem(text: 'Tambak 2 - Fadli Farm', value: 1),
                  AppDropdownItem(text: 'Tambak 2 - Fadli Farm', value: 2),
                ],
                value: -1,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
