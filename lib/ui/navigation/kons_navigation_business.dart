import 'package:flutter/material.dart';

import '../../entities/conference_settings.dart';
import '../../entities/consultation.dart';
import '../../entities/kno.dart';
import '../common/conference_page.dart';
import '../kons_screen_business/join_kons_page.dart';
import '../kons_screen_business/kno_details_page.dart';
import '../kons_screen_business/kons_main_view.dart';
import '../kons_screen_business/select_date_time_view.dart';
import '../kons_screen_business/select_theme_view.dart';
import '../kons_screen_business/list_kno_page.dart';
import 'route_name.dart';

class KonsNavigationBusiness {
  static const initialRoute = AppNavRouteName.konsMainBusiness;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppNavRouteName.konsMainBusiness:
        return MaterialPageRoute(builder: (context) => const KonsMainView());
      case AppNavRouteName.joinKonsBusiness:
        final arg = settings.arguments as Consultation;
        return MaterialPageRoute(
            builder: (context) => JoinKonsPage(consultation: arg));

      case AppNavRouteName.videoBusiness:
        final arg = settings.arguments as ConferenceSettings;
        return MaterialPageRoute(
            builder: (context) => VideoConferencePage(settings: arg));

      case AppNavRouteName.listKnoBusiness:
        return MaterialPageRoute(builder: (context) => const ListKnoPage());
      case AppNavRouteName.knoDetailsBusiness:
        final arg = settings.arguments as NadzorOrgans;
        return MaterialPageRoute(builder: (context) => KNODetails(kno: arg));
      case AppNavRouteName.selectDateTimeBusiness:
        final arg = settings.arguments as NadzorOrgans;
        return MaterialPageRoute(
            builder: (context) => SelectDateTimeView(kno: arg));
      case AppNavRouteName.selectThemeBusiness:
        return MaterialPageRoute(builder: (context) => SelectThemeView());
      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
                body: Center(child: Text('Nested Navigation error!!!'))));
    }
  }
}
