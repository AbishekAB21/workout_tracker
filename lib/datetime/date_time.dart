// return today's date as yyyymmdd
String todaysDate()
{
  // today
  var dateTimeObject = DateTime.now();

  // year in format yyyy
  String year = dateTimeObject.year.toString();

  // month in format mm
  String month = dateTimeObject.month.toString();
  if(month.length == 1)
  {
    month = '0$month';
  }

  // day in format dd
  String day = dateTimeObject.day.toString();
  if(day.length == 1)
  {
    day ='0$day';
  }

  // final format yyyymmdd
  String yyyymmdd = year + month + day;

  return yyyymmdd;
}

// convert string yyyymmdd to DateTime object (For heatmap)
DateTime createDatetimeObject(String yyyymmdd)
{
  int yyyy = int.parse(yyyymmdd.substring(0,4)); // position zero to four which gives yyyy
  int mm = int.parse(yyyymmdd.substring(4,6)); // positions four to six which gives mm
  int dd = int.parse(yyyymmdd.substring(6,8)); // positions six to eight which gives dd

  DateTime dateTimeObject = DateTime(yyyy, mm, dd);
  return dateTimeObject;
}

// convert DateTime object to string yyyymmdd (For heatmap)
String convertDateTimeToYYYYMMDD(DateTime dateTime)
{
  // year in format yyyyy
  String year = dateTime.year.toString();

  // month in format mm
  String month = dateTime.month.toString();
  if(month.length == 1)
  {
    month = '0$month';
  }

  //day in format dd
  String day = dateTime.year.toString();
  if(day.length == 1)
  {
    day = '0$day';
  }

  // final format
  String yyyymmdd = year + month + day;
  return yyyymmdd;
}
