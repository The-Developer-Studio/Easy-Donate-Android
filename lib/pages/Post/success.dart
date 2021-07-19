import 'package:easydonatefinal/widgets/bottomNavigation.dart';
import 'package:easydonatefinal/widgets/branding.dart';
import 'package:flutter/material.dart';

class SuccessPage extends StatefulWidget {
  @override
  _SuccessPageState createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(35.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'images/post.png',
                height: 300,
              ),
              Text(
                'Your post has been posted!',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange,
                    fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.',
                style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    // color: Colors.deepOrange,
                    fontSize: 10),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BottomNavigation()),
                        (route) => false);
                  },
                  child: Container(
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.deepOrangeAccent,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Center(
                      child: Text(
                        'Finish',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(child: Container()),
              Center(child: Branding()),
            ],
          ),
        ),
      ),
    );
  }
}
