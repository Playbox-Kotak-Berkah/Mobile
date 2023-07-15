import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playbox/app/controller/dashboard_controller.dart';
import 'package:playbox/partials/dashboard/do_card.dart';
import 'package:playbox/partials/dashboard/ph_card.dart';
import 'package:playbox/partials/dashboard/salinity_card.dart';
import 'package:playbox/partials/dashboard/temp_card.dart';

class DasboardCard extends GetView<DashboardController> {
  const DasboardCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
      ],
    );
  }
}
