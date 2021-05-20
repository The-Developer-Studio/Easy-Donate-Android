import 'package:easydonatefinal/lists/donationsList.dart';
import 'package:easydonatefinal/widgets/appBar.dart';
import 'package:flutter/material.dart';

class DonationsPage extends StatefulWidget {
  @override
  _DonationsPageState createState() => _DonationsPageState();
}

class _DonationsPageState extends State<DonationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                CustomAppBar(),
              ];
            },
            body: DonationsList()),
      ),
    );
  }
}
