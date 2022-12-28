import 'package:amartha_todo/core/utils/custom_date_utils.dart';

class TodoUtils {
  static int generateTodoId() {
    final String date = CustomDateUtils.dateCode();
    final String time = CustomDateUtils.timeCode();

    return int.parse('$date$time');
  }
}
