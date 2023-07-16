import 'package:intl/intl.dart';

String convertDate(String date) {
  DateFormat inputFormat = DateFormat('M/d/yyyy');
  DateFormat outputFormat = DateFormat('yyyy-MM-dd');

  DateTime parsedDate = inputFormat.parse(date);
  String formattedDate = outputFormat.format(parsedDate);

  return formattedDate;
}
