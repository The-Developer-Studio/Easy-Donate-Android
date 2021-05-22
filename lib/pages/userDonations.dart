import 'package:easydonatefinal/backend/data.dart';
import 'package:easydonatefinal/widgets/listCard.dart';
import 'package:flutter/material.dart';

class UserDonations extends StatefulWidget {
  @override
  _UserDonationsState createState() => _UserDonationsState();
}

class _UserDonationsState extends State<UserDonations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
      ),
      body: StreamBuilder(
        stream: getUserDonations(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data.size,
                  itemBuilder: (context, index) {
                    return ListCard(
                      location: snapshot.data.docs[index]['location'],
                      postedTime:
                          duration(snapshot.data.docs[index]['postedTime']),
                      title: snapshot.data.docs[index]['title'],
                    );
                  })
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
