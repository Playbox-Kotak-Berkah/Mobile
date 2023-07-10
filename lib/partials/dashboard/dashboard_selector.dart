import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playbox/app/controller/dashboard_controller.dart';
import 'package:playbox/partials/dashboard/farm_dialog.dart';
import 'package:playbox/utils/color_constants.dart';
import 'package:playbox/utils/text_styles.dart';
import 'package:playbox/widgets/app_dropdown.dart';
import 'package:sizer/sizer.dart';

class DashboardSelector extends StatefulWidget {
  const DashboardSelector({super.key});

  @override
  State<DashboardSelector> createState() => _DashboardSelectorState();
}

class _DashboardSelectorState extends State<DashboardSelector> {
  DashboardController controller = DashboardController.i;

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
                        text: element.name, value: int.parse('${element.id}')),
                  )
                  .toList(),
              AppDropdownItem(
                text: "",
                value: -1,
                child: TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => FarmDialog(),
                    );
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        size: 18,
                        color: ColorConstants.primary[500],
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Tambah Data Tambak",
                        style: body5TextStyle(
                          weight: FontWeight.w500,
                          color: ColorConstants.primary[500],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
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
              child: Obx(
                () => AppDropdown(
                  onChanged: (e) {
                    // asdas
                  },
                  isDisabled: controller.farmId.value == -1 ? true : false,
                  hintText: "Pilih Kolam",
                  items: [
                    AppDropdownItem(text: 'Tambak 1 - Ben\'s Farm', value: 0),
                    AppDropdownItem(text: 'Tambak 2 - Fadli Farm', value: 1),
                    AppDropdownItem(text: 'Tambak 2 - Fadli Farm', value: 2),
                    AppDropdownItem(
                      text: "",
                      value: -1,
                      child: TextButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(
                              Icons.add,
                              size: 18,
                              color: ColorConstants.primary[500],
                            ),
                            SizedBox(width: 8),
                            Text(
                              "Tambah Kolam",
                              style: body5TextStyle(
                                color: ColorConstants.primary[500],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                  value: -1,
                ),
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
                isDisabled: true,
                hintText: "Pilih Siklus",
                items: [
                  AppDropdownItem(text: 'Tambak 1 - Ben\'s Farm', value: 0),
                  AppDropdownItem(text: 'Tambak 2 - Fadli Farm', value: 1),
                  AppDropdownItem(text: 'Tambak 2 - Fadli Farm', value: 2),
                  AppDropdownItem(
                    text: "",
                    value: -1,
                    child: TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.add,
                            size: 18,
                            color: ColorConstants.primary[500],
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Tambah Kolam",
                            style: body5TextStyle(
                              color: ColorConstants.primary[500],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
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
