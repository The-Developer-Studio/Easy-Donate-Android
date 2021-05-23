import 'package:easydonatefinal/backend/data.dart';
import 'package:easydonatefinal/pages/showdetails.dart';
import 'package:easydonatefinal/widgets/appBar.dart';
import 'package:easydonatefinal/widgets/listCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sliding_up_panel/sliding_up_panel_widget.dart';

class Requests extends StatefulWidget {
  @override
  _RequestsState createState() => _RequestsState();
}

class _RequestsState extends State<Requests> {
  ScrollController scrollController;

  ///The controller of sliding up panel
  SlidingUpPanelController panelController = SlidingUpPanelController();

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.offset >=
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        panelController.expand();
      } else if (scrollController.offset <=
              scrollController.position.minScrollExtent &&
          !scrollController.position.outOfRange) {
        panelController.anchor();
      } else {}
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
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
            body: StreamBuilder(
              stream: getRequests(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data.size,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ShowDetails(
                                        category: snapshot.data.docs[index]
                                            ['category'],
                                        desc: snapshot.data.docs[index]['desc'],
                                        location: snapshot.data.docs[index]
                                            ['location'],
                                        quantity: snapshot.data.docs[index]
                                            ['quantity'],
                                      )),
                            );
                          },
                          child: ListCard(
                            location: snapshot.data.docs[index]['location'],
                            postedTime: duration(
                                snapshot.data.docs[index]['postedTime']),
                            title: snapshot.data.docs[index]['title'],
                          ),
                        );
                      });
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            )),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     FirebaseAuth.instance
      //         .signOut()
      //         .whenComplete(() => Navigator.pushAndRemoveUntil(
      //             context,
      //             MaterialPageRoute(
      //                 builder: (context) => Login(
      //                       isSignup: false,
      //                     )),
      //             (route) => false));
      //   },
      // ),
    );
  }
}
