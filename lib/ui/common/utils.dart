import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../entities/consult_topics.dart';
import '../../entities/control_types.dart';
import '../../entities/kno.dart';
import '../../mobX/common/common_state.dart';

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
  return minutesBeforeCons < 5000;
  // && minutesBeforeCons > -15; // ДЛЯ ТЕСТА
}

NadzorOrgans getKNOById(BuildContext context, int id) {
  return Provider.of<CommonState>(context, listen: false)
      .knos!
      .where((element) => element.id == id)
      .first;
}

ControlTypes getControlTypeById(BuildContext context, int idKNO, int idType) {
  final NadzorOrgans kno = getKNOById(context, idKNO);
  return kno.controlTypes.where((element) => element.id == idType).first;
}

ConsultTopics getConsultTopicById(
    BuildContext context, int idKNO, int idType, int idTopic) {
  final ControlTypes t = getControlTypeById(context, idKNO, idType);
  return t.consultTopics.where((element) => element.id == idTopic).first;
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

String getWordOrg(int num, String one, String two, String five) {
  num %= 100;
  if (num >= 5 && num <= 20) {
    return five;
  }
  num %= 10;
  if (num == 1) {
    return one;
  }
  if (num >= 2 && num <= 4) {
    return two;
  }
  return five;
}
