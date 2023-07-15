import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playbox/app/controller/dashboard_controller.dart';
import 'package:playbox/utils/color_constants.dart';
import 'package:playbox/utils/form_converter.dart';
import 'package:playbox/widgets/app_textfield.dart';
import 'package:sizer/sizer.dart';
import 'package:playbox/utils/text_styles.dart';

class PondDialog extends StatefulWidget {
  const PondDialog({super.key});

  @override
  State<PondDialog> createState() => _PondDialogState();
}

class _PondDialogState extends State<PondDialog> {
  DashboardController controller = DashboardController.i;
  final form = {
    "name": TextEditingController(),
  };
  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 100.w,
              padding: EdgeInsets.all(8),
              child: Form(
                key: key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Tambak",
                      style: body5TextStyle(weight: FontWeight.w600),
                    ),
                    SizedBox(height: 4),
                    Text(
                      controller.selectedFarm.value!.name,
                    ),
                    SizedBox(height: 16),
                    AppTextfield(
                      label: "Nama Kolam",
                      controller: form['name']!,
                      placeholder: "ex: A1",
                      validator: (e) {
                        if (e!.isEmpty) {
                          return "Nama tidak boleh kosong";
                        }
                        return null;
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
                                final data =
                                    formConverter(form) as Map<String, String>;
                                controller.createPond(data);
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
