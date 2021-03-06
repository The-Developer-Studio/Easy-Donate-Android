import 'package:easydonatefinal/pages/Post/post.dart';
import 'package:flutter/material.dart';

import '../pages/account.dart';
import '../pages/donationsPage.dart';
import '../pages/requestPage.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Requests(),
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
              label: 'Requests',
              backgroundColor: Colors.deepOrange),
          BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard),
              label: 'Donations',
              backgroundColor: Colors.orange),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_box_outlined),
              label: 'Post new',
              backgroundColor: Colors.deepOrange),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: 'Accounts',
              backgroundColor: Colors.orange),
        ],
      ),
    );
  }
}
