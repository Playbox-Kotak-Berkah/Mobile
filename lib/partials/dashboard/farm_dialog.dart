import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:playbox/widgets/app_textfield.dart';
import 'package:sizer/sizer.dart';

class FarmDialog extends StatelessWidget {
  final farmController = TextEditingController();

  FarmDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
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
                    controller: farmController,
                    placeholder: 'asd',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
