import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../common/size_config.dart';
import '../login_screens/widgets/logo_full.dart';
import '../navigation/kons_navigation.dart';
import '../theme/app_color.dart';
import 'widgets/panel.dart';
import 'widgets/select_entities.dart';
import 'widgets/user_kons.dart';

class ConsultationPage extends StatefulWidget {
  const ConsultationPage({super.key});

  @override
  State<ConsultationPage> createState() => _ConsultationPageState();
}

class _ConsultationPageState extends State<ConsultationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(/*title: FittedBox(child: LogoFull())*/), // ПЕРЕДЕЛАТЬ
      body: Navigator(
        initialRoute: KonsNavigation.initialRoute,
        onGenerateRoute: KonsNavigation.onGenerateRoute,
      ),
    );
  }
}
