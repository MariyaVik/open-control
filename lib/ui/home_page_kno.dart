import 'package:flutter/material.dart';

import 'kons_screen_kno/kons_main_page.dart';
import 'profile_screen/profile_page.dart';

class HomePageKNO extends StatefulWidget {
  const HomePageKNO({super.key});

  @override
  State<HomePageKNO> createState() => _HomePageKNOState();
}

class _HomePageKNOState extends State<HomePageKNO>
    with TickerProviderStateMixin {
  late TabController _tabController;
  int _currentTabIndex = 0;
  final _bottomItems = [
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
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: [
              ConsultationPageKNO(),
              ProfilePage(),
            ]),
        bottomNavigationBar: BottomNavigationBar(
            onTap: (currentIndex) {
              _tabController.index = currentIndex;
              setState(() {
                _currentTabIndex = currentIndex;
                _tabController.animateTo(_currentTabIndex);
              });
            },
            currentIndex: _currentTabIndex,
            items: _bottomItems),
      ),
    );
  }
}
