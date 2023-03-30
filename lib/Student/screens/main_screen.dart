import 'package:attendance/Student/screens/reports_screen.dart';
import 'package:attendance/Student/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'home_screen.dart';
import 'leave_request_screen.dart';
import 'login_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  static List _screens = [
    HomeScreen(),
    ReportsScreen(),
    LeaveRequestScreen(),
    SettingsScreen(),
  ];
  int _selectedIndex = 0;
  void tappedIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text("R O L L   C A L L"),
        backgroundColor: Color(0xff0024F1),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: tappedIndex,
          currentIndex: _selectedIndex,
          showUnselectedLabels: false,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white54,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color.fromARGB(255, 71, 147, 233),
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.pie_chart_outline_rounded), label: 'Reports'),
            BottomNavigationBarItem(
                icon: Icon(Icons.pending_actions_outlined), label: 'Leave/OD'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined), label: 'Settings'),
          ]),
    );
    ;
  }
}
