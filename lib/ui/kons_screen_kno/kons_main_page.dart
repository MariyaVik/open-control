import 'package:flutter/material.dart';
import '../navigation/kons_navigation_kno.dart';

class ConsultationPageKNO extends StatelessWidget {
  const ConsultationPageKNO({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(/*title: FittedBox(child: LogoFull())*/ actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.notifications))
      ]), // ПЕРЕДЕЛАТЬ
      body: const Navigator(
        initialRoute: KonsNavigationKNO.initialRoute,
        onGenerateRoute: KonsNavigationKNO.onGenerateRoute,
      ),
    );
  }
}
