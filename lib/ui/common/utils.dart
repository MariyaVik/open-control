DateTime getDateFromString(String date) {
  var d = date.split('-').map((e) => int.parse(e)).toList();
  return DateTime(d[0], d[1], d[2]);
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
