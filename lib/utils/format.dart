import 'package:intl/intl.dart';

toCurrency(String text) {
  double number = double.parse(text);
  return NumberFormat.currency(locale: 'en_GB', symbol: '\$').format(number);
}
