import 'package:easydonatefinal/backend/data.dart';
import 'package:easydonatefinal/widgets/listCard.dart';
import 'package:flutter/material.dart';

class DonationsList extends StatefulWidget {
  @override
  _DonationsListState createState() => _DonationsListState();
}

class _DonationsListState extends State<DonationsList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: getDonations(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data.size,
              itemBuilder: (context, index) {
                return ListCard(
                  location: snapshot.data.docs[index]['location'],
                  postedTime: duration(snapshot.data.docs[index]['postedTime']),
                  title: snapshot.data.docs[index]['title'],
                );
              });
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
