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

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Home(),
    DonationsPage(),
    PostNew(),
    AccountPage(),
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: new Text('Requests'),
              backgroundColor: Colors.deepOrange),
          BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard),
              title: new Text('Donations'),
              backgroundColor: Colors.orange),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_box_outlined),
              title: new Text('Post new'),
              backgroundColor: Colors.deepOrange),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              title: new Text('Accounts'),
              backgroundColor: Colors.orange),
        ],
      ),
    );
  }
}
