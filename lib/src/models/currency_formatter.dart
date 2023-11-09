import 'package:intl/intl.dart';

abstract class CurrencyFormatter {
  static String formatCurrency(double price) {
    String numbFormat =
        NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$').format(price);

    return numbFormat;
  }
}
