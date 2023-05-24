import 'package:flutter/material.dart';
import 'package:open_control/entities/kno.dart';

import '../kons_screen/kno_details_page.dart';
import '../kons_screen/kno_main_view.dart';
import '../kons_screen/select_date_time_view.dart';
import '../kons_screen/select_theme_view.dart';
import 'route_name.dart';

class KonsNavigation {
  static const initialRoute = AppNavRouteName.konsMain;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppNavRouteName.konsMain:
        return MaterialPageRoute(builder: (context) => const KonsMainView());
      case AppNavRouteName.knoDetails:
        final arg = settings.arguments as NadzorOrgans;
        return MaterialPageRoute(builder: (context) => KNODetails(kno: arg));
      case AppNavRouteName.selectDateTime:
        return MaterialPageRoute(
            builder: (context) => const SelectDateTimeView());
      case AppNavRouteName.selectTheme:
        return MaterialPageRoute(builder: (context) => const SelectThemeView());
      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
                body: Center(child: Text('Nested Navigation error!!!'))));
    }
  }
}
