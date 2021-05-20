import 'package:easydonatefinal/pages/aftersplash.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

// Splash Screen
class Splash extends StatefulWidget {
  @override
  _SplashState createState() => new _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 3,
        navigateAfterSeconds: AfterSplash(),
        image: Image.asset('images/logo.png'),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        loaderColor: Colors.deepOrangeAccent);
  }
}
