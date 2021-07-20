import 'package:easydonatefinal/models/faq.dart';
import 'package:flutter/material.dart';

class FaqTile extends StatelessWidget {
  final Faq faq;
  const FaqTile({Key key, this.faq}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        faq.question,
        textAlign: TextAlign.justify,
      ),
      children: [
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            faq.answer,
            textAlign: TextAlign.justify,
          ),
        )
      ],
    );
  }
}
