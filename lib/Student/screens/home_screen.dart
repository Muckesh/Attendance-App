import 'package:attendance/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(user?.email ?? 'User Email'),
            ElevatedButton(
              onPressed: signOut,
              child: Text("Signout"),
            ),
          ],
        ),
      ),
    );
  }
}
