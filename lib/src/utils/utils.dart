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
    String day = date.day<10?'0'+date.day.toString():date.day.toString();
    String month = date.month<10?'0'+date.month.toString():date.month.toString();
    String hour = date.hour<10?'0'+date.hour.toString():date.hour.toString();
    String minute = date.minute<10?'0'+date.minute.toString():date.minute.toString();

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
}
