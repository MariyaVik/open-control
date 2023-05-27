import 'package:flutter/material.dart';

DateTime getDateFromString(String date) {
  String dateNorm = date.substring(0, 10);
  var d = dateNorm.split('-').map((e) => int.parse(e)).toList();
  return DateTime(d[0], d[1], d[2]);
}

DateTime getDateTime(String date, String time) {
  String dateNorm = date.substring(0, 10);
  var d = dateNorm.split('-').map((e) => int.parse(e)).toList();
  var t = time.split('-')[0].split(':').map((e) => int.parse(e)).toList();
  return DateTime(d[0], d[1], d[2], t[0], t[1]);
}

bool isTimeBegin(String date, String time) {
  final minutesBeforeCons =
      getDateTime(date, time).difference(DateTime.now()).inMinutes;
  return minutesBeforeCons < 7000; // ДЛЯ ТЕСТА
}

String getWeekDay(int num) {
  var days = [
    'Понедельник',
    'Вторник',
    'Среда',
    'Четверг',
    'Пятница',
    'Суббота',
    'Воскресенье'
  ];
  return days[num - 1];
}

String getMonthName(int num) {
  var month = [
    'января',
    'февраля',
    'марта',
    'апреля',
    'мая',
    'июня',
    'июля',
    'августа',
    'сентября',
    'октября',
    'ноября',
    'декабря'
  ];
  return month[num - 1];
}
