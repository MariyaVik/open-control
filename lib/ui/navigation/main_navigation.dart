import 'package:flutter/material.dart';

import '../chat_screen/chat_page.dart';
import '../home_page.dart';
import '../login_screens/login_kno_page.dart';
import '../login_screens/login_page.dart';
import '../login_screens/login_user_page.dart';
import 'route_name.dart';

class AppNavigation {
  static const initialRoute = AppNavRouteName.login;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppNavRouteName.login:
        return MaterialPageRoute(builder: (context) => const LoginPage());
      case AppNavRouteName.loginKHO:
        return MaterialPageRoute(builder: (context) => const LoginKHOPage());
      case AppNavRouteName.loginUser:
        return MaterialPageRoute(builder: (context) => const LoginUserPage());
      case AppNavRouteName.home:
        return MaterialPageRoute(builder: (context) => const HomePage());
      case AppNavRouteName.chat:
        return MaterialPageRoute(builder: (context) => const ChatPage());

      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
                body: Center(child: Text('Navigation error!!!'))));
    }
  }
}
