import 'package:attendance/Student/screens/reports_screen.dart';
import 'package:attendance/auth.dart';
import 'package:attendance/Student/screens/home_screen.dart';
import 'package:attendance/Student/screens/login_screen.dart';
import 'package:flutter/material.dart';

import 'Student/screens/main_screen.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Auth().authStateChages,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MainScreen();
          } else {
            return const LoginScreen();
          }
        });
  }
}
