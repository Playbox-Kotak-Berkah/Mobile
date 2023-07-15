import 'package:flutter/widgets.dart';

Map<String, dynamic> formConverter(Map<String, TextEditingController> form) {
  return form.map((key, value) => MapEntry(key, value.text));
}
