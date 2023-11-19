import 'package:intl/intl.dart';

abstract class DateTimeFormat {
  static String formatDateTime(DateTime dateTime) {
    var dateTimeFormat = DateFormat('dd/MM/yyyy kk:mm').format(dateTime);

    return dateTimeFormat;
  }
}
