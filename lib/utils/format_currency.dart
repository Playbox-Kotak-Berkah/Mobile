String formatCurrency(num amount) {
  String formattedAmount = amount.toString();
  int length = formattedAmount.length;

  if (length > 3) {
    int commaIndex = length % 3;
    if (commaIndex == 0) commaIndex = 3;

    while (commaIndex < length) {
      formattedAmount =
          "${formattedAmount.substring(0, commaIndex)}.${formattedAmount.substring(commaIndex)}";
      commaIndex += 4;
      length++;
    }
  }

  return 'Rp. $formattedAmount,- /kg';
}
