import 'package:flutter/material.dart';

import '../../entities/conference_settings.dart';
import '../../entities/faq.dart';
import '../chat_screen/chat_page.dart';
import '../common/conference_page.dart';
import '../faq/faq_details_page.dart';
import '../faq/faq_page.dart';
import '../home_page_business.dart';
import '../home_page_kno.dart';
import '../kons_screen_business/kons_details_page.dart';
import '../login_screens/login_kno_page.dart';
import '../login_screens/login_page.dart';
import '../login_screens/login_user_page.dart';
import '../notification/notification_page.dart';
import 'route_name.dart';

class AppNavigation {
  static const initialRoute = AppNavRouteName.login;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppNavRouteName.login:
        return MaterialPageRoute(builder: (context) => const LoginPage());
      case AppNavRouteName.loginKHO:
        return MaterialPageRoute(builder: (context) => const LoginKHOPage());
      case AppNavRouteName.loginBusiness:
        return MaterialPageRoute(builder: (context) => const LoginUserPage());
      case AppNavRouteName.homeBusiness:
        return MaterialPageRoute(builder: (context) => HomePage());
      case AppNavRouteName.chat:
        return MaterialPageRoute(builder: (context) => const ChatPage());

      case AppNavRouteName.homeKNO:
        return MaterialPageRoute(builder: (context) => HomePageKNO());

      case AppNavRouteName.notification:
        return MaterialPageRoute(
            builder: (context) => const NotificationPage());

      case AppNavRouteName.videoCall:
        final arg = settings.arguments as ConferenceSettings;
        return MaterialPageRoute(
            builder: (context) => VideoConferencePage(settings: arg));

      case AppNavRouteName.faq:
        return MaterialPageRoute(builder: (context) => const FaqPage());
      case AppNavRouteName.faqDetails:
        final arg = settings.arguments as Faq;
        return MaterialPageRoute(
            builder: (context) => FaqDetailsPage(faq: arg));

      case AppNavRouteName.konsDateilsBusiness:
        final arg = settings.arguments as int;
        return MaterialPageRoute(
            builder: (context) => KonsDetailsPage(konsId: arg));

      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
                body: Center(child: Text('Navigation error!!!'))));
    }
  }
}
