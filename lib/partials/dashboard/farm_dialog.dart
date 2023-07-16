import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:playbox/app/controller/dashboard_controller.dart';
import 'package:playbox/utils/color_constants.dart';
import 'package:playbox/utils/form_converter.dart';
import 'package:playbox/utils/text_styles.dart';
import 'package:playbox/widgets/app_textfield.dart';
import 'package:sizer/sizer.dart';

class FarmDialog extends StatefulWidget {
  const FarmDialog({super.key});

  @override
  State<FarmDialog> createState() => _FarmDialogState();
}

class _FarmDialogState extends State<FarmDialog> {
  final form = {
    "name": TextEditingController(),
  };
  DashboardController controller = DashboardController.i;

  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: key,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: 100.w,
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    AppTextfield(
                      label: "Nama Tambak",
                      controller: form['name']!,
                      placeholder: 'Nama tambak anda',
                      validator: (e) {
                        if (e!.isEmpty) {
                          return "Nama tidak boleh kosong";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
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
                                final data = formConverter(form);
                                controller.createFarm(data);
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
            ],
          ),
        ),
      ),
    );
  }
}
