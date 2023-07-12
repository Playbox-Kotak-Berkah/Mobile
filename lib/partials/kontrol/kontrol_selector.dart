import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playbox/app/controller/kontrol_controller.dart';
import 'package:playbox/widgets/app_dropdown.dart';
import 'package:sizer/sizer.dart';

class KontrolSelector extends StatefulWidget {
  const KontrolSelector({super.key});

  @override
  State<KontrolSelector> createState() => _KontrolSelectorState();
}

class _KontrolSelectorState extends State<KontrolSelector> {
  KontrolController controller = KontrolController.i;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => AppDropdown(
              hintText: "Pilih Tambak",
              prefixIcon: Icons.location_on_outlined,
              items: [
                ...controller.farms
                    .map(
                      (element) => AppDropdownItem(
                          text: element.name,
                          value: int.parse('${element.id}')),
                    )
                    .toList(),
              ],
              value: controller.selectedFarm.value == null
                  ? null
                  : controller.selectedFarm.value!.id,
              onChanged: (e) {
                controller.selectedFarm.value =
                    controller.farms.firstWhere((element) => element.id == e);
                controller.getPond(e!);
              }),
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
              child: Obx(
                () => AppDropdown(
                  onChanged: (e) {
                    controller.selectedPond.value = controller.ponds
                        .firstWhere((element) => element.id == e);
                    controller.getDetailPond();
                  },
                  isDisabled:
                      controller.selectedFarm.value == null ? true : false,
                  hintText: "Pilih Kolam",
                  items: [
                    ...controller.ponds
                        .map(
                          (element) => AppDropdownItem(
                              text: "Kolam ${element.name}",
                              value: int.parse('${element.id}')),
                        )
                        .toList(),
                  ],
                  value: controller.selectedPond.value == null
                      ? null
                      : controller.selectedPond.value!.id,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
