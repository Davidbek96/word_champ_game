import 'package:intl/intl.dart';

class DateTimeHerlper {
  static int getFormattedDateMillisec(DateTime date) {
    final DateFormat formatter = DateFormat("yyyy-MM-dd");
    final String formattedDate = formatter.format(date);
    // log("=== Month: $formattedDate");
    return DateTime.parse(formattedDate).millisecondsSinceEpoch;
  }
}
