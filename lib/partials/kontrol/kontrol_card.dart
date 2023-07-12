import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playbox/app/controller/kontrol_controller.dart';
import 'package:playbox/app/types/indicator_type.dart';
import 'package:playbox/partials/kontrol/card_indicator.dart';

class KontrolCard extends StatefulWidget {
  const KontrolCard({super.key});

  @override
  State<KontrolCard> createState() => _KontrolCardState();
}

class _KontrolCardState extends State<KontrolCard> {
  KontrolController controller = KontrolController.i;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Obx(
                () => CardIndicator(
                  type: Indicator.bulb,
                  active: controller.selectedPond.value?.statusBulb ?? false,
                ),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Obx(
                () => CardIndicator(
                  type: Indicator.fan,
                  active: controller.selectedPond.value?.statusFan ?? false,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: Obx(
                () => CardIndicator(
                  type: Indicator.water,
                  active: controller.selectedPond.value?.statusWater ?? false,
                ),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Container(),
            ),
          ],
        )
      ],
    );
  }
}
