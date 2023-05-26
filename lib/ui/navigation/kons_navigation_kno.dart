import 'package:flutter/material.dart';

import '../../entities/consultation.dart';
import '../kons_screen_kno/consultation_info_page.dart';
import '../kons_screen_kno/kons_shedule_page.dart';
import 'route_name.dart';

class KonsNavigationKNO {
  static const initialRoute = AppNavRouteName.konsMainKNO;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppNavRouteName.konsMainKNO:
        return MaterialPageRoute(builder: (context) => const KonsShedulePage());
      case AppNavRouteName.konsDetailsKNO:
        final arg = settings.arguments as Consultation;
        return MaterialPageRoute(
            builder: (context) => ConsultationInfoPage(consultation: arg));

      // case AppNavRouteName.selectDateTimeBusiness:
      //   final arg = settings.arguments as NadzorOrgans;
      //   return MaterialPageRoute(
      //       builder: (context) => SelectDateTimeView(kno: arg));
      // case AppNavRouteName.selectThemeBusiness:
      //   return MaterialPageRoute(builder: (context) => SelectThemeView());
      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
                body: Center(child: Text('Nested KNO Navigation error!!!'))));
    }
  }
}
