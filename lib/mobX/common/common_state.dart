import 'dart:developer';

import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

import '../../entities/all_consultations.dart';
import '../../entities/consultation.dart';
import '../../entities/info.dart';
import '../../entities/kno.dart';
import '../../entities/user_info.dart';
import '../../services/business_api.dart';
import '../../ui/app.dart';
import '../../ui/navigation/route_name.dart';

part 'common_state.g.dart';

class CommonState = _CommonState with _$CommonState;

abstract class _CommonState with Store {
  _CommonState() {}

  @observable
  int activeTabIndex = 0;

  @observable
  UserInfo user = UserInfo();

  @observable
  AllConsultations allConsultations = AllConsultations();

  @computed
  ObservableList<Consultation> get activeKons =>
      ObservableList.of(allConsultations.activeKons);

  @computed
  ObservableList<Consultation> get finishedKons =>
      ObservableList.of(allConsultations.finishedKons);

  @observable
  Consultation currentKons = Consultation(userId: 1);

  @observable
  List<NadzorOrgans>? knos;

  @observable
  List<NadzorOrgans>? knosFilter;

  @observable
  ObservableList<String> dates = ObservableList.of([]);
  @observable
  Map<String, dynamic> allSlots = {};

  @observable
  bool isDateLoading = true;

  @observable
  bool hasPrevDates = false;

  @observable
  bool hasNextDates = true;

  @computed
  bool get hasSlots => dates.isNotEmpty;

  @observable
  bool isAuth = false;

  @observable
  bool isLoading = true;

  @action
  void updateTab(int index) {
    if ((user.isKno == null || user.isKno == false) && index == 1) {
      mainNavigatorKey.currentState!.pushNamed(AppNavRouteName.chat);
    } else {
      activeTabIndex = index;
    }
  }

  @action
  void checkPrevDates() {
    var dayCurWeekString = dates.last;
    var d = dayCurWeekString.split('-').map((e) => int.parse(e)).toList();
    DateTime dayCurWeek = DateTime(d[0], d[1], d[2]);

    var dayPrevWeek = dayCurWeek.add(const Duration(days: -7));

    List<String> dd = [];

    int weekDayNumber = dayPrevWeek.weekday;
    for (int i = 0; i < 8 - weekDayNumber; i++) {
      DateTime newDate = dayPrevWeek.add(Duration(days: i));
      String newDateStr = DateFormat('yyyy-MM-dd').format(newDate);
      print('проверяем эту дату ' + newDateStr);
      if (allSlots.containsKey(newDateStr)) {
        dd.add(newDateStr);
      }
    }

    if (dd.isNotEmpty) {
      hasPrevDates = true;
    } else {
      hasPrevDates = false;
    }
  }

  @action
  void checkNextDates() {
    var dayCurWeekString = dates.last;
    var d = dayCurWeekString.split('-').map((e) => int.parse(e)).toList();
    DateTime dayCurWeek = DateTime(d[0], d[1], d[2]);

    var dayPrevWeek = dayCurWeek.add(const Duration(days: 7));

    List<String> dd = [];

    int weekDayNumber = dayPrevWeek.weekday;
    for (int i = weekDayNumber; i >= 0; i--) {
      DateTime newDate = dayPrevWeek.add(Duration(days: -i));
      String newDateStr = DateFormat('yyyy-MM-dd').format(newDate);
      print('проверяем эту дату ' + newDateStr);
      if (allSlots.containsKey(newDateStr)) {
        dd.add(newDateStr);
      }
    }

    if (dd.isNotEmpty) {
      hasNextDates = true;
    } else {
      hasNextDates = false;
    }
  }

  @action
  Future<void> getSlots() async {
    isDateLoading = true;
    allSlots = await BusinessAPI.instance.getSlots(user.token!);

    // String nowDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    // print(nowDate);
    String firstDateString = allSlots.keys.first;
    var d = firstDateString.split('-').map((e) => int.parse(e)).toList();
    DateTime firstDate = DateTime(d[0], d[1], d[2]);
    print(firstDate);
    ObservableList<String> dd = ObservableList.of([]);

    int weekDayNumber = firstDate.weekday;
    for (int i = 0; i < 8 - weekDayNumber; i++) {
      DateTime newDate = firstDate.add(Duration(days: i));
      String newDateStr = DateFormat('yyyy-MM-dd').format(newDate);
      print('проверяем эту дату ' + newDateStr);
      print(allSlots.containsKey(newDateStr));
      if (allSlots.containsKey(newDateStr)) {
        dd.add(newDateStr);
      }
    }
    dates = dd;
    checkNextDates();
    checkPrevDates();
    isDateLoading = false;
  }

  @action
  void getCurrentWeek(DateTime date) {
    isDateLoading = true;
    ObservableList<String> dd = ObservableList.of([]);
    int weekDayNumber = date.weekday;

    for (int i = weekDayNumber; i > 0; i--) {
      DateTime newDate = date.add(Duration(days: -i));
      String newDateStr = DateFormat('yyyy-MM-dd').format(newDate);
      print('проверяем эту дату ' + newDateStr);
      print(allSlots.containsKey(newDateStr));
      if (allSlots.containsKey(newDateStr)) {
        dd.add(newDateStr);
      }
    }

    for (int i = 0; i < 8 - weekDayNumber; i++) {
      DateTime newDate = date.add(Duration(days: i));
      String newDateStr = DateFormat('yyyy-MM-dd').format(newDate);
      print('проверяем эту дату ' + newDateStr);
      print(allSlots.containsKey(newDateStr));
      if (allSlots.containsKey(newDateStr)) {
        dd.add(newDateStr);
      }
    }
    dates = dd;
    print(dates);
    isDateLoading = false;
  }

  @action
  Future<void> getKNOs() async {
    final Info info = await BusinessAPI.instance.getKnoInfo(user.token!);
    log('инфа получена');
    knos = info.nadzorOrgans;
    knosFilter = knos;
  }

  @action
  Future<void> filteringKNO(String text) async {
    if (text.isEmpty) {
      knosFilter = knos;
    } else {
      knosFilter = await BusinessAPI.instance.postKno(user.token!, text);
    }
  }

  @action
  Future<void> getAllCons() async {
    isLoading = true;
    allConsultations = await BusinessAPI.instance.getConsultations(user.token!);
    isLoading = false;
  }
}
