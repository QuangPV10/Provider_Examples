// return today as yyyymmdd

String todayDateYYYYMMDD() {
  final dateTimeObj = DateTime.now();
  final year = dateTimeObj.year.toString();
  String month = dateTimeObj.month.toString();
  month.length == 1 ? '0$month' : month;
  String day = dateTimeObj.day.toString();
  day.length == 1 ? '0$month' : month;

  String yyyymmdd = year + month + day;
  return yyyymmdd;
}

// convert string yyyymmdd to Datetime object
DateTime createDateTimeObject(String yyyymmdd) {
  int yyyy = int.parse(yyyymmdd.substring(0, 4));
  int mm = int.parse(yyyymmdd.substring(4, 6));
  int dd = int.parse(yyyymmdd.substring(6, 8));

  DateTime dateTime = DateTime(yyyy, mm, dd);
  return dateTime;
}

// convert Datetime object to yyyymmdd
String converDateTimeToYYYYMMDD(DateTime dateTime) {
  final year = dateTime.year.toString();
  String month = dateTime.month.toString();
  month.length == 1 ? '0$month' : month;
  String day = dateTime.day.toString();
  day.length == 1 ? '0$month' : month;

  String yyyymmdd = year + month + day;
  return yyyymmdd;
}
