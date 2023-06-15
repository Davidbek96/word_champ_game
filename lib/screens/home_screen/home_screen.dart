import 'package:flutter/material.dart';
import 'package:riddle_leader/screens/home_screen/home_widget.dart';
import 'package:riddle_leader/screens/home_screen/profile_widget.dart';
import 'package:riddle_leader/screens/home_screen/settings_widget.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 1;

  final List<Widget> _children = [
    // Put your pages here
    ProfileWidget(),
    HomeWidget(),
    SettingsWidget(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.white54,
          type: BottomNavigationBarType.shifting,
          backgroundColor: Colors.black12,
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.person),
              label: 'profile'.tr,
              backgroundColor: Colors.black12,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: 'home'.tr,
              backgroundColor: Colors.black12,
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.black12,
              icon: const Icon(Icons.settings),
              label: 'settings'.tr,
            ),
          ],
        ),
      ),
    );
  }
}
