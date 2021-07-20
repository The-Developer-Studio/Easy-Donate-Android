import 'package:easydonatefinal/backend/data.dart';
import 'package:easydonatefinal/widgets/faqTile.dart';
import 'package:flutter/material.dart';

class FaqList extends StatefulWidget {
  const FaqList({Key key}) : super(key: key);

  @override
  _FaqListState createState() => _FaqListState();
}

class _FaqListState extends State<FaqList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: faqList,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return FaqTile(
                      faq: snapshot.data[index],
                    );
                  })
              : Center(
                  child: CircularProgressIndicator(),
                );
        });
  }
}
