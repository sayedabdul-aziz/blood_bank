import 'package:blood_bank/core/color.dart';
import 'package:flutter/material.dart';

import 'dashboard/view/dashboard_view.dart';
import 'donor/view/donor_view.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int _currentIndex = 0;

  List<Widget> screens = [
    const DashboardView(),
    const DonorListView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: ColorManager.primary,
        unselectedItemColor: ColorManager.grey,
        items: const [
          BottomNavigationBarItem(
              label: 'Dashboard',
              icon: Icon(
                Icons.dashboard_rounded,
              )),
          BottomNavigationBarItem(
              label: 'Donor List',
              icon: Icon(
                Icons.person,
              )),
        ],
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
      ),
    );
  }
}
