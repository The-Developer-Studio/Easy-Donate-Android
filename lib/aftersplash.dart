import 'package:easydonatefinal/backend/authentication.dart';
import 'package:easydonatefinal/login.dart';
import 'package:easydonatefinal/main.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class AfterSplash extends StatefulWidget {
  @override
  _AfterSplashState createState() => _AfterSplashState();
}

class _AfterSplashState extends State<AfterSplash> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: authcheck(),
        builder: (context, snapshot) {
          if (snapshot.data != null) return BottomNavigation();
          return Login(
            isSignup: false,
          );
        });
  }
}
