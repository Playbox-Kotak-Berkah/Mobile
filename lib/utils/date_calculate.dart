int dateCalculate(String date1) {
  DateTime date1DateTime = DateTime.parse(date1);

  DateTime now = DateTime.now();

  Duration difference = now.difference(date1DateTime);

  int days = difference.inDays;

  return days;
}
