import 'package:flutter/material.dart';
import 'package:open_control/ui/navigation/main_navigation.dart';

import 'theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: themeLight,
      initialRoute: AppNavigation.initialRoute,
      onGenerateRoute: AppNavigation.onGenerateRoute,
    );
  }
}
