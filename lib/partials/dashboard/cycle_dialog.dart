import 'package:flutter/material.dart';
import 'package:playbox/app/controller/dashboard_controller.dart';
import 'package:playbox/utils/color_constants.dart';
import 'package:playbox/utils/date_converter.dart';
import 'package:playbox/utils/form_converter.dart';
import 'package:playbox/utils/pick_date.dart';
import 'package:playbox/utils/text_styles.dart';
import 'package:playbox/widgets/app_textfield.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

class CycleDialog extends StatefulWidget {
  const CycleDialog({super.key});

  @override
  State<CycleDialog> createState() => _CycleDialogState();
}

class _CycleDialogState extends State<CycleDialog> {
  DashboardController controller = DashboardController.i;
  final key = GlobalKey<FormState>();
  final form = {
    "name": TextEditingController(),
    "start_date": TextEditingController(),
  };

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(5),
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
              child: Form(
                key: key,
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
                      validator: (e) {
                        if (e!.isEmpty) {
                          return "Nama siklus tidak boleh kosong";
                        }
                        return null;
                      },
                      onChange: (e) {
                        print(e);
                      },
                    ),
                    SizedBox(height: 16),
                    AppTextfield(
                      readOnly: true,
                      label: "Tanggal Mulai",
                      ontap: () async {
                        final pickedDate = await pickDate(context,
                            initialTime: DateTime.now());
                        if (pickedDate != null) {
                          form['start_date']!.text = pickedDate;
                        }
                      },
                      controller: form['start_date']!,
                      placeholder: "YYYY-MM-DD",
                      keyboardType: TextInputType.datetime,
                      validator: (e) {
                        if (e!.isEmpty) {
                          return "Start date tidak boleh kosong";
                        }
                        return null;
                      },
                      onChange: (e) {
                        print(e);
                      },
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorConstants.slate[200],
                            ),
                            onPressed: () {
                              Get.back();
                            },
                            child: Text(
                              "Batal",
                              style: body5TextStyle(
                                weight: FontWeight.w600,
                                color: ColorConstants.slate[600],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              if (key.currentState!.validate()) {
                                form['start_date']!.text =
                                    convertDate(form['start_date']!.text);

                                final data = formConverter(form);
                                controller.createCycle(data);
                              }
                            },
                            child: Text("Tambah Data"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
