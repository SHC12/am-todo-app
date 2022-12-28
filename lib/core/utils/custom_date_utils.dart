import 'package:intl/intl.dart';

class CustomDateUtils {
  static String parseDateToFullDisplayDate(String dateString) {
    final DateTime tempDate = DateTime.parse(dateString).toLocal();
    String date = DateFormat('EEEE, dd MMMM y', 'id_ID').format(tempDate);
    return date;
  }

  static String parseDateToSimpleDateTimeHour(String dateString) {
    final DateTime tempDate = DateTime.parse(dateString).toLocal();
    String date = DateFormat('dd MMM y HH:mm', 'id_ID').format(tempDate);
    return date;
  }

  static String parseDateToDetailDisplayDate(String dateString) {
    final DateTime tempDate = DateTime.parse(dateString).toLocal(); // iso8601
    String date = DateFormat('y-MM-dd HH:mm aaa', 'id_ID').format(tempDate);
    return date;
  }

  static String dateTimeToFullDisplayDate(DateTime dateTime) {
    String date = DateFormat('EEEE, dd MMMM y', 'id_ID').format(dateTime.toLocal());
    return date;
  }

  static String dateTimeToDetailDisplayDate(DateTime dateTime) {
    String date = DateFormat('y-MM-dd HH:mm:ss', 'id_ID').format(dateTime.toLocal());
    return date;
  }

  static String dateTimeToDetailDisplayDateHour(DateTime dateTime) {
    String date = DateFormat('y-MM-dd HH:mm', 'id_ID').format(dateTime.toLocal());
    return date;
  }

  static String dateTimeToSimpleDate(DateTime dateTime) {
    String date = DateFormat('y-MM-dd', 'id_ID').format(dateTime.toLocal());
    return date;
  }

  static String dateCode() {
    final DateTime dateTime = DateTime.now();
    final int monthDefault = dateTime.month;
    final String year = dateTime.year.toString();
    final String month = (monthDefault < 10 ? '0' : '') + monthDefault.toString();
    final String day = (dateTime.day < 10 ? '0' : '') + dateTime.day.toString();
    final String now = '$year$month$day';
    return now;
  }

  static String timeCode() {
    final DateTime dateTime = DateTime.now();
    final String hours = '${dateTime.hour < 10 ? '0' : ''}${dateTime.hour}';
    final String minutes = '${dateTime.minute < 10 ? '0' : ''}${dateTime.minute}';
    final String seconds = '${dateTime.second < 10 ? '0' : ''}${dateTime.second}';
    final String time = '$hours$minutes$seconds';
    return time;
  }
}
