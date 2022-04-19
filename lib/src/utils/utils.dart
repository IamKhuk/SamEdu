class Utils {
  static bool passwordValidator(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  static bool emailValidator(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  static String newsDateFormat(DateTime date) {
    String day =
        date.day < 10 ? '0' + date.day.toString() : date.day.toString();
    String month =
        date.month < 10 ? '0' + date.month.toString() : date.month.toString();
    String hour =
        date.hour < 10 ? '0' + date.hour.toString() : date.hour.toString();
    String minute = date.minute < 10
        ? '0' + date.minute.toString()
        : date.minute.toString();

    return day +
        '.' +
        month +
        '.' +
        date.year.toString() +
        ' | ' +
        hour +
        ':' +
        minute;
  }

  static List<DateTime> dateListFormat() {
    DateTime today = DateTime.now();
    List<DateTime> l = [today];
    for (int i = 1; i < 7; i++) {
      l.add(today.add(Duration(days: i)));
    }
    return l;
  }

  static String weekDayFormat(DateTime date) {
    String week = '';
    date.weekday == 1
        ? week = 'Mon'
        : date.weekday == 2
            ? week = 'Tue'
            : date.weekday == 3
                ? week = 'Wed'
                : date.weekday == 4
                    ? week = 'Thu'
                    : date.weekday == 5
                        ? week = 'Fri'
                        : date.weekday == 6
                            ? week = 'Sat'
                            : week = 'Sun';

    return week;
  }

  static String weekFormat(DateTime date) {
    String week = '';
    date.weekday == 1
        ? week = 'Mo'
        : date.weekday == 2
            ? week = 'Tu'
            : date.weekday == 3
                ? week = 'W'
                : date.weekday == 4
                    ? week = 'Th'
                    : date.weekday == 5
                        ? week = 'Fr'
                        : date.weekday == 6
                            ? week = 'Sa'
                            : week = 'Su';
    return week;
  }

  static String monthFormat(DateTime date) {
    String month = '';

    date.month == 1
        ? month = 'January'
        : date.month == 2
            ? month = 'February'
            : date.month == 3
                ? month = 'March'
                : date.month == 4
                    ? month = 'April'
                    : date.month == 5
                        ? month = 'May'
                        : date.month == 6
                            ? month = 'June'
                            : date.month == 7
                                ? month = 'July'
                                : date.month == 8
                                    ? month = 'August'
                                    : date.month == 9
                                        ? month = 'September'
                                        : date.month == 10
                                            ? month = 'October'
                                            : date.month == 11
                                                ? month = 'November'
                                                : month = 'December';

    return month;
  }
}
