import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../entities/app_tab.dart';
import '../mobX/common/common_state.dart';
import 'kons_screen_business/kons_page.dart';
import 'main_screen/main_page.dart';
import 'profile_screen/profile_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final _bottomItems = [
    const BottomNavigationBarItem(
        icon: ImageIcon(AssetImage('assets/icons/home.png')), label: 'главная'),
    const BottomNavigationBarItem(
        icon: ImageIcon(AssetImage('assets/icons/chat.png')), label: 'чат-бот'),
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
              state.activeTabIndex == AppTabBussiness.main.index
                  ? const MainPage()
                  // : state.activeTabIndex == AppTabBussiness.chat.index
                  //     ? const ChatPage()
                  : state.activeTabIndex == AppTabBussiness.consultation.index
                      ? const ConsultationPageBusiness()
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
