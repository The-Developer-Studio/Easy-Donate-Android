import 'package:easydonatefinal/account.dart';
import 'package:easydonatefinal/donations.dart';
import 'package:easydonatefinal/home.dart';
import 'package:easydonatefinal/post.dart';
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
      // initialRoute: '/',
      routes: {
        '/donations': (context) => DonationsPage(),
        '/accounts': (context) => AccountPage(),
        '/post': (context) => PostNew(),
      },
      theme: new ThemeData(
          primaryColor: Colors.deepOrange,
          accentColor: Colors.deepOrangeAccent,
          fontFamily: "Montserrat"),
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
