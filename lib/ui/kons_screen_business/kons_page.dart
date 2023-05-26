import 'package:flutter/material.dart';
import '../navigation/kons_navigation_business.dart';

class ConsultationPageBusiness extends StatelessWidget {
  const ConsultationPageBusiness({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(/*title: FittedBox(child: LogoFull())*/), // ПЕРЕДЕЛАТЬ
      body: const Navigator(
        initialRoute: KonsNavigationBusiness.initialRoute,
        onGenerateRoute: KonsNavigationBusiness.onGenerateRoute,
      ),
    );
  }
}
