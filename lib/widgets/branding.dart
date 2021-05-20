import 'package:flutter/material.dart';

class Branding extends StatefulWidget {
  @override
  _BrandingState createState() => _BrandingState();
}

class _BrandingState extends State<Branding> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'images/logo.png',
          height: 40,
        ),
        SizedBox(
          width: 15,
        ),
        Text(
          'Easy Donate',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.deepOrange,
              fontSize: 15),
        )
      ],
    );
  }
}
