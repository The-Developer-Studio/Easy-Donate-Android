import 'package:easydonatefinal/widgets/listCard.dart';
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
      stream: getRequests(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data.size,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: ListCard(
                    location: snapshot.data.docs[index]['location'],
                    postedTime:
                        duration(snapshot.data.docs[index]['postedTime']),
                    title: snapshot.data.docs[index]['title'],
                  ),
                );
              });
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
