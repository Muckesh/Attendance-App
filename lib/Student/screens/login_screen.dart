import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:attendance/auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? errorMessage = "";
  bool isLogin = true;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
          email: _controllerEmail.text, password: _controllerPassword.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
          email: _controllerEmail.text, password: _controllerPassword.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _title() {
    return const Text("FireBase Auth");
  }

  Widget _entryField(String title, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: title,
      ),
    );
  }

  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : 'Humm ? $errorMessage');
  }

  Widget _submitButton() {
    return ElevatedButton(
      onPressed:
          isLogin ? signInWithEmailAndPassword : createUserWithEmailAndPassword,
      child: Text(isLogin ? "Login" : "Register"),
    );
  }

  Widget _loginOrRegisterButton() {
    return TextButton(
        onPressed: () {
          setState(() {
            isLogin = !isLogin;
          });
        },
        child: Text(isLogin ? "Register instead" : "Login instead"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(
      //   title: _title(),
      // ),
      // body: Container(
      //   child: Column(
      //     children: [
      //       _entryField('Email', _controllerEmail),
      //       _entryField("Password", _controllerPassword),
      //       _errorMessage(),
      //       _submitButton(),
      //       _loginOrRegisterButton(),
      //     ],
      //   ),
      // ),
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xff0024F1),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Center(
                  child: Text(
                "Welcome Back!!",
                style: TextStyle(
                  color: Color(0xffFBFBFC),
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              )),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              padding: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(color: Color(0xffFBFBFC)),
              height: double.infinity,
              width: double.infinity,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 18.0, horizontal: 32),
                child: Column(
                  children: [
                    TextField(
                      controller: _controllerEmail,
                      decoration: InputDecoration(
                        hintText: "Email",
                        prefixIcon: Icon(Icons.email_outlined),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      obscureText: true,
                      controller: _controllerPassword,
                      decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: Icon(Icons.lock_outline),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    _errorMessage(),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: Color(0xff1A54F8),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: signInWithEmailAndPassword,
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
                            "Log in",
                            style: TextStyle(
                              color: Color(0xffFBFBFC),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   height: 15,
                    // ),
                    // Divider(
                    //   height: 10,
                    //   color: Colors.grey,
                    // ),
                    // SizedBox(
                    //   height: 15,
                    // ),
                    // GestureDetector(
                    //   onTap: () {},
                    //   child: Container(
                    //     width: double.infinity,
                    //     height: 50,
                    //     decoration: BoxDecoration(
                    //         // color: Color(0xff1A54F8),
                    //         borderRadius: BorderRadius.circular(10),
                    //         border: Border.all(color: Colors.grey)),
                    //     child: Center(
                    //       child: Text(
                    //         "Sign up",
                    //         style: TextStyle(
                    //           color: Colors.grey,
                    //           fontWeight: FontWeight.bold,
                    //           fontSize: 16,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
