import 'package:intl/intl.dart';

class Utils {
  static String formateDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    return DateFormat('MM-dd / HH:mm').format(dateTime);
  }
}
