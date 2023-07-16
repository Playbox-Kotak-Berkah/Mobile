import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playbox/app/controller/dashboard_controller.dart';
import 'package:playbox/utils/color_constants.dart';
import 'package:playbox/utils/form_converter.dart';
import 'package:playbox/utils/text_styles.dart';
import 'package:playbox/widgets/app_textfield.dart';

class InputDialog extends StatefulWidget {
  const InputDialog({super.key});

  @override
  State<InputDialog> createState() => _InputDialogState();
}

class _InputDialogState extends State<InputDialog> {
  Map<String, TextEditingController> form = {
    "ph_pagi": TextEditingController(),
    "ph_siang": TextEditingController(),
    "ph_malam": TextEditingController(),
    "suhu_pagi": TextEditingController(),
    "suhu_siang": TextEditingController(),
    "suhu_malam": TextEditingController(),
    "do_pagi": TextEditingController(),
    "do_siang": TextEditingController(),
    "do_malam": TextEditingController(),
    "garam_pagi": TextEditingController(),
    "garam_siang": TextEditingController(),
    "garam_malam": TextEditingController()
  };
  final DashboardController controller = DashboardController.i;

  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Form(
          key: key,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Input Data Siklus",
                  style: body4TextStyle(weight: FontWeight.bold),
                ),
                SizedBox(height: 8),
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
                SizedBox(height: 8),
                Text(
                  "Siklus",
                  style: body5TextStyle(
                    weight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "${controller.selectedCycle.value?.name ?? ""} ",
                  style: body5TextStyle(
                    color: ColorConstants.slate[500],
                    weight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: AppTextfield(
                        keyboardType: TextInputType.number,
                        label: 'pH Pagi',
                        placeholder: 'pH',
                        controller: form['ph_pagi']!,
                        validator: (e) {
                          if (e!.isEmpty) {
                            return "required";
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(width: 6),
                    Expanded(
                      child: AppTextfield(
                        validator: (e) {
                          if (e!.isEmpty) {
                            return "required";
                          }
                          return null;
                        },
                        label: 'pH Siang',
                        keyboardType: TextInputType.number,
                        placeholder: 'pH',
                        controller: form['ph_siang']!,
                      ),
                    ),
                    SizedBox(width: 6),
                    Expanded(
                      child: AppTextfield(
                        validator: (e) {
                          if (e!.isEmpty) {
                            return "required";
                          }
                          return null;
                        },
                        label: 'pH Malam',
                        placeholder: 'pH',
                        keyboardType: TextInputType.number,
                        controller: form['ph_malam']!,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: AppTextfield(
                        validator: (e) {
                          if (e!.isEmpty) {
                            return "required";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        label: 'DO Pagi',
                        placeholder: 'ppm',
                        controller: form['do_pagi']!,
                      ),
                    ),
                    SizedBox(width: 6),
                    Expanded(
                      child: AppTextfield(
                        validator: (e) {
                          if (e!.isEmpty) {
                            return "required";
                          }
                          return null;
                        },
                        label: 'DO Siang',
                        keyboardType: TextInputType.number,
                        placeholder: 'ppm',
                        controller: form['do_siang']!,
                      ),
                    ),
                    SizedBox(width: 6),
                    Expanded(
                      child: AppTextfield(
                        validator: (e) {
                          if (e!.isEmpty) {
                            return "required";
                          }
                          return null;
                        },
                        label: 'DO Malam',
                        placeholder: 'ppm',
                        keyboardType: TextInputType.number,
                        controller: form['do_malam']!,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: AppTextfield(
                        validator: (e) {
                          if (e!.isEmpty) {
                            return "required";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        label: 'Suhu Pagi',
                        placeholder: '°C',
                        controller: form['suhu_pagi']!,
                      ),
                    ),
                    SizedBox(width: 6),
                    Expanded(
                      child: AppTextfield(
                        validator: (e) {
                          if (e!.isEmpty) {
                            return "required";
                          }
                          return null;
                        },
                        label: 'Suhu Siang',
                        keyboardType: TextInputType.number,
                        placeholder: '°C',
                        controller: form['suhu_siang']!,
                      ),
                    ),
                    SizedBox(width: 6),
                    Expanded(
                      child: AppTextfield(
                        validator: (e) {
                          if (e!.isEmpty) {
                            return "required";
                          }
                          return null;
                        },
                        label: 'Suhu Malam',
                        placeholder: '°C',
                        keyboardType: TextInputType.number,
                        controller: form['suhu_malam']!,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: AppTextfield(
                        validator: (e) {
                          if (e!.isEmpty) {
                            return "required";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        label: 'Salt Pagi',
                        placeholder: 'ppt',
                        controller: form['garam_pagi']!,
                      ),
                    ),
                    SizedBox(width: 6),
                    Expanded(
                      child: AppTextfield(
                        validator: (e) {
                          if (e!.isEmpty) {
                            return "required";
                          }
                          return null;
                        },
                        label: 'Salt Siang',
                        keyboardType: TextInputType.number,
                        placeholder: 'ppt',
                        controller: form['garam_siang']!,
                      ),
                    ),
                    SizedBox(width: 6),
                    Expanded(
                      child: AppTextfield(
                        validator: (e) {
                          if (e!.isEmpty) {
                            return "required";
                          }
                          return null;
                        },
                        label: 'Salt Malam',
                        placeholder: 'ppt',
                        keyboardType: TextInputType.number,
                        controller: form['garam_malam']!,
                      ),
                    ),
                  ],
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
                            final data = formConverter(form);
                            Map<String, double> convertedMap =
                                data.map((key, value) {
                              return MapEntry(key, double.parse(value));
                            });
                            controller.inputCycleDaily(convertedMap);
                          }
                        },
                        child: Text("Input Data"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
