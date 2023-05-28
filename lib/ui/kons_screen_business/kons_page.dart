import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import '../common/app_bar_logo.dart';
import '../navigation/kons_navigation_business.dart';
import '../navigation/route_name.dart';

class ConsultationPageBusiness extends StatefulWidget {
  const ConsultationPageBusiness({super.key});

  @override
  State<ConsultationPageBusiness> createState() =>
      _ConsultationPageBusinessState();
}

class _ConsultationPageBusinessState extends State<ConsultationPageBusiness> {
  @override
  void initState() {
    super.initState();
    getInitMessage();
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      log('Открыли из уведомления');
    });
  }

  void getInitMessage() async {
    RemoteMessage? message =
        await FirebaseMessaging.instance.getInitialMessage();
    if (message != null) {
      Navigator.pushNamed(context, AppNavRouteName.notification);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarLogo(context),
      body: Navigator(
        key: konsKey,
        initialRoute: KonsNavigationBusiness.initialRoute,
        onGenerateRoute: KonsNavigationBusiness.onGenerateRoute,
      ),
    );
  }
}

GlobalKey<NavigatorState> konsKey = GlobalKey<NavigatorState>();
