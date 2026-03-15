import 'package:intl/intl.dart';

class Utils {
  static String formateDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);
  }
}
