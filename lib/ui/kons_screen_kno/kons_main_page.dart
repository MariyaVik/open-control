import 'package:flutter/material.dart';
import '../common/app_bar_logo.dart';
import '../navigation/kons_navigation_kno.dart';
import '../navigation/route_name.dart';

class ConsultationPageKNO extends StatelessWidget {
  const ConsultationPageKNO({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarLogo(
        context,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppNavRouteName.notification);
              },
              icon: Icon(Icons.notifications))
        ],
      ),
      body: const Navigator(
        initialRoute: KonsNavigationKNO.initialRoute,
        onGenerateRoute: KonsNavigationKNO.onGenerateRoute,
      ),
    );
  }
}
