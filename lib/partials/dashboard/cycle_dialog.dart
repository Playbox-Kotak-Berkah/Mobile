import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CycleDialog extends StatefulWidget {
  const CycleDialog({super.key});

  @override
  State<CycleDialog> createState() => _CycleDialogState();
}

class _CycleDialogState extends State<CycleDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              width: 100.w,
              padding: EdgeInsets.all(16),
              child: Column(
                children: [],
              ),
            )
          ],
        ),
      ),
    );
  }
}
