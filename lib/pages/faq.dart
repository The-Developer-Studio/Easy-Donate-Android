import 'package:easydonatefinal/lists/faqList.dart';
import 'package:flutter/material.dart';

class FaqPage extends StatelessWidget {
  const FaqPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text('FAQs'),
      ),
      body: FaqList(),
    );
  }
}
