import 'package:flutter/material.dart';

import 'chat_screen/chat_page.dart';
import 'kons_screen/kons_page.dart';
import 'main_screen/main_page.dart';
import 'navigation/route_name.dart';
import 'profile_screen/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;
  int _currentTabIndex = 0;
  final _bottomItems = [
    const BottomNavigationBarItem(
        icon: ImageIcon(AssetImage('assets/icons/home.png')), label: 'главная'),
    BottomNavigationBarItem(
        icon: ImageIcon(AssetImage('assets/icons/chat.png')), label: 'чат-бот'),
    BottomNavigationBarItem(
        icon: ImageIcon(AssetImage('assets/icons/kons.png')),
        label: 'консультация'),
    const BottomNavigationBarItem(
        icon: ImageIcon(AssetImage('assets/icons/profile.png')),
        label: 'профиль'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: [
              MainPage(),
              ChatPage(),
              ConsultationPage(),
              ProfilePage(),
            ]),
        bottomNavigationBar: BottomNavigationBar(
            onTap: (currentIndex) {
              if (currentIndex == 1) {
                Navigator.of(context).pushNamed(AppNavRouteName.chat);
              } else {
                _tabController.index = currentIndex;
                setState(() {
                  _currentTabIndex = currentIndex;
                  _tabController.animateTo(_currentTabIndex);
                });
              }
            },
            currentIndex: _currentTabIndex,
            items: _bottomItems),
      ),
    );
  }
}
