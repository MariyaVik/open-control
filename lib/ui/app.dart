import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:open_control/ui/navigation/route_name.dart';
import 'package:provider/provider.dart';
import 'package:open_control/ui/navigation/main_navigation.dart';

import '../mobX/common/common_state.dart';
import 'theme/theme.dart';

GlobalKey<NavigatorState> mainNavigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<void> setupInteractedMessage() async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  void _handleMessage(RemoteMessage message) {
    log(message.data.toString());
    log('Открыли из уведомления');
    mainNavigatorKey.currentState!.pushNamed(
        AppNavRouteName.konsDateilsBusiness,
        arguments: int.parse(message.data['consultation-id']));
  }

  @override
  void initState() {
    super.initState();
    setupInteractedMessage();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => CommonState()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: themeLight,
        navigatorKey: mainNavigatorKey,
        initialRoute: AppNavigation.initialRoute,
        onGenerateRoute: AppNavigation.onGenerateRoute,
      ),
    );
  }
}
