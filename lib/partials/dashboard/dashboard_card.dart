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
              child: Obx(
                () => PhCard(
                  data: controller.cycleDaily.value?.ph_realtime,
                  morning: controller.cycleDaily.value?.ph_pagi,
                  afternoon: controller.cycleDaily.value?.ph_siang,
                  night: controller.cycleDaily.value?.ph_malam,
                ),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Obx(
                () => TempCard(
                  data: controller.cycleDaily.value?.suhu_realtime,
                  morning: controller.cycleDaily.value?.suhu_pagi,
                  afternoon: controller.cycleDaily.value?.suhu_siang,
                  night: controller.cycleDaily.value?.suhu_malam,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Obx(
                () => DoCard(
                  data: controller.cycleDaily.value?.do_realtime,
                  morning: controller.cycleDaily.value?.do_pagi,
                  afternoon: controller.cycleDaily.value?.do_siang,
                  night: controller.cycleDaily.value?.do_malam,
                ),
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
        SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Container(),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Akhiri Siklus'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
