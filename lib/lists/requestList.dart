import 'package:easydonatefinal/widgets/itemTile.dart';
import 'package:flutter/material.dart';
import '../backend/data.dart';

class RequestsList extends StatefulWidget {
  @override
  _RequestsListState createState() => _RequestsListState();
}

class _RequestsListState extends State<RequestsList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: requests,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return ItemTile(
                      item: snapshot.data[index],
                      isDonation: false,
                    );
                  })
              : Center(
                  child: CircularProgressIndicator(),
                );
        });
  }
}
