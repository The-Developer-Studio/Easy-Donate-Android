import 'package:easydonatefinal/API/getItems.dart';
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
    return FutureBuilder(
        future: fetchRequest,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return ItemTile(
                      isDonation: false,
                      item: snapshot.data[index],
                    );
                  })
              : Center(
                  child: CircularProgressIndicator(),
                );
        });
  }
}
