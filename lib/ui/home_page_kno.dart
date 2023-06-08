import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../entities/app_tab.dart';
import '../mobX/common/common_state.dart';
import 'kons_screen_kno/kons_main_page.dart';
import 'profile_screen/profile_page.dart';

class HomePageKNO extends StatelessWidget {
  HomePageKNO({Key? key}) : super(key: key);
  final _bottomItems = [
    const BottomNavigationBarItem(
        icon: ImageIcon(AssetImage('assets/icons/kons.png')),
        label: 'консультация'),
    const BottomNavigationBarItem(
        icon: ImageIcon(AssetImage('assets/icons/profile.png')),
        label: 'профиль'),
  ];

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<CommonState>(context);
    return SafeArea(
      child: Scaffold(
        body: Observer(
          builder: (context) =>
              state.activeTabIndex == AppTabKNO.consultation.index
                  ? const ConsultationPageKNO()
                  : const ProfilePage(),
        ),
        bottomNavigationBar: Observer(
            builder: (context) => BottomNavigationBar(
                  currentIndex: state.activeTabIndex,
                  onTap: state.updateTab,
                  items: _bottomItems,
                )),
      ),
    );
  }
}
