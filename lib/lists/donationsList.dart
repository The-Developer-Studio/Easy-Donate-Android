import 'package:easydonatefinal/backend/data.dart';
import 'package:easydonatefinal/widgets/itemTile.dart';
import 'package:flutter/material.dart';

class DonationsList extends StatefulWidget {
  @override
  _DonationsListState createState() => _DonationsListState();
}

class _DonationsListState extends State<DonationsList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: donations,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return ItemTile(
                    isDonation: true,
                    item: snapshot.data[index],
                  );
                })
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}
