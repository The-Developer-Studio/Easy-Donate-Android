import 'package:easydonatefinal/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Root Widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
          primaryColor: Colors.deepOrange,
          accentColor: Colors.deepOrangeAccent,
          fontFamily: "Montserrat"),
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
