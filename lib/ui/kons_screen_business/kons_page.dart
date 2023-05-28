import 'package:flutter/material.dart';
import '../common/app_bar_logo.dart';
import '../navigation/kons_navigation_business.dart';

class ConsultationPageBusiness extends StatelessWidget {
  const ConsultationPageBusiness({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarLogo(context),
      body: const Navigator(
        initialRoute: KonsNavigationBusiness.initialRoute,
        onGenerateRoute: KonsNavigationBusiness.onGenerateRoute,
      ),
    );
  }
}
