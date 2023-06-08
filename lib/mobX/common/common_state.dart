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

  @observable
  Consultation currentKons = Consultation(userId: 1);

  @observable
  List<NadzorOrgans>? knos;

  @observable
  List<NadzorOrgans>? knosFilter;

  @observable
  List<String> dates = [];
  @observable
  Map<String, dynamic> allSlots = {};

  @computed
  bool get hasSlots => dates.isNotEmpty;

  @observable
  bool isAuth = false;

  @action
  void updateTab(int index) {
    if ((user.isKno == null || user.isKno == false) && index == 1) {
      mainNavigatorKey.currentState!.pushNamed(AppNavRouteName.chat);
    } else {
      activeTabIndex = index;
    }
  }

  @action
  Future<void> getSlots() async {
    allSlots = await BusinessAPI.instance.getSlots(user.token!);

    dates = allSlots.keys.toList();
  }

  @action
  Future<void> getKNOs() async {
    final Info info = await BusinessAPI.instance.getKnoInfo(user.token!);
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
}
