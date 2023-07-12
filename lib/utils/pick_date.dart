import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Future<String?> pickDate(BuildContext context, {DateTime? initialTime}) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: initialTime ?? DateTime.now(),
    firstDate: DateTime(1900),
    lastDate: DateTime(2100),
  );
  if (picked != null) {
    return DateFormat.yMd().format(picked);
  }
  return null;
}

String convertToUtc(String date, String time) {
  String datetimeString = '$date $time';
  DateTime datetime = DateFormat('M/d/yyyy h:mm').parse(datetimeString);

  return datetime.toUtc().toString();
}
