import 'package:flutter/material.dart';
import 'package:playbox/app/controller/dashboard_controller.dart';
import 'package:playbox/utils/color_constants.dart';
import 'package:playbox/utils/pick_date.dart';
import 'package:playbox/utils/text_styles.dart';
import 'package:playbox/widgets/app_textfield.dart';
import 'package:sizer/sizer.dart';

class CycleDialog extends StatefulWidget {
  const CycleDialog({super.key});

  @override
  State<CycleDialog> createState() => _CycleDialogState();
}

class _CycleDialogState extends State<CycleDialog> {
  DashboardController controller = DashboardController.i;
  final form = {
    "name": TextEditingController(),
    "start_date": TextEditingController(),
  };

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 100.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Tambak",
                  style: body5TextStyle(
                    weight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  controller.selectedFarm.value?.name ?? "",
                  style: body5TextStyle(
                    color: ColorConstants.slate[500],
                    weight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  "Kolam",
                  style: body5TextStyle(
                    weight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Kolam ${controller.selectedPond.value?.name ?? ""}",
                  style: body5TextStyle(
                    color: ColorConstants.slate[500],
                    weight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 16),
                AppTextfield(
                  label: "Nama Siklus",
                  controller: form['name']!,
                  placeholder: "ex: Siklus 1 Jun 23",
                ),
                SizedBox(height: 16),
                AppTextfield(
                  readOnly: true,
                  label: "Tanggal Mulai",
                  ontap: () async {
                    final pickedDate =
                        await pickDate(context, initialTime: DateTime.now());
                    if (pickedDate != null) {
                      form['start_date']!.text = pickedDate;
                    }
                  },
                  controller: form['start_date']!,
                  placeholder: "YYYY-MM-DD",
                  keyboardType: TextInputType.datetime,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
