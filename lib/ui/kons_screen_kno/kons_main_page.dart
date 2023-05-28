import 'package:flutter/material.dart';
import '../common/app_bar_logo.dart';
import '../navigation/kons_navigation_kno.dart';

class ConsultationPageKNO extends StatelessWidget {
  const ConsultationPageKNO({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarLogo(
        context,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications))
        ],
      ),
      body: const Navigator(
        initialRoute: KonsNavigationKNO.initialRoute,
        onGenerateRoute: KonsNavigationKNO.onGenerateRoute,
      ),
    );
  }
}
