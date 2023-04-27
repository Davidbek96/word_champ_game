import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:riddle_leader/screens/home_screen.dart';
import 'package:riddle_leader/screens/profile_screen.dart';
import 'package:riddle_leader/screens/settings_screen.dart';

class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentIndex = 1;

  final List<Widget> _children = [
    // Put your pages here
    ProfileScreen(),
    HomeScreen(),
    SettingsScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white54,
        type: BottomNavigationBarType.shifting,
        backgroundColor: Colors.black12,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Colors.black12,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.black12,
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black12,
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}