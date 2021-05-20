import 'package:easydonatefinal/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

// Root Widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.deepOrange,
              accentColor: Colors.deepOrangeAccent),
          fontFamily: "Montserrat"),
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
