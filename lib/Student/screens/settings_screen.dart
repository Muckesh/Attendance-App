import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../auth.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});
  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text("Settings Screen"),
          SizedBox(
            height: 100,
          ),
          GestureDetector(
            onTap: signOut,
            child: Container(
              // width: double.infinity,
              alignment: Alignment.center,
              height: 50,
              decoration: BoxDecoration(
                color: Color(0xff1A54F8),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  "Sign Out",
                  style: TextStyle(
                    color: Color(0xffFBFBFC),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
          // GestureDetector(
          //   onTap: signOut,
          //   child: Container(
          //     // width: double.infinity,
          //     alignment: Alignment.center,
          //     height: 50,
          //     decoration: BoxDecoration(
          //       color: Color(0xff1A54F8),
          //       borderRadius: BorderRadius.circular(10),
          //     ),
          //     child: Center(
          //       child: Text(
          //         "Sign Out",
          //         style: TextStyle(
          //           color: Color(0xffFBFBFC),
          //           fontWeight: FontWeight.bold,
          //           fontSize: 16,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
