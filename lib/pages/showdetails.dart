import 'package:easydonatefinal/backend/data.dart';
import 'package:easydonatefinal/models/user.dart';
import 'package:easydonatefinal/widgets/branding.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ShowDetails extends StatefulWidget {
  final String user;
  final String location;
  final String category;
  final String quantity;
  final String desc;

  const ShowDetails(
      {Key key,
      @required this.location,
      @required this.category,
      @required this.quantity,
      @required this.desc,
      this.user})
      : super(key: key);
  @override
  _ShowDetailsState createState() => _ShowDetailsState();
}

class _ShowDetailsState extends State<ShowDetails> {
  UserDetails user;

  @override
  Widget build(BuildContext context) {
    userDetails.listen((users) {
      setState(() {
        user = users.where((element) => element.uid == widget.user).first;
      });
    });
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.deepOrange,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: user != null
            ? Container(
                margin: EdgeInsets.symmetric(horizontal: 15.0),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shadows: [],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 30, left: 30, right: 30),
                      child: Container(
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.black26,
                              child: const Text('AS'),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  user.name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on_outlined,
                                      size: 12,
                                      color: Colors.black54,
                                    ),
                                    Text(
                                      widget.location,
                                      style: TextStyle(
                                          color: Colors.black54, fontSize: 12),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Divider(
                      height: 0.5,
                      color: Colors.black45,
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 30.0, left: 30, right: 30),
                        child: Container(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Type:',
                                      style: TextStyle(
                                          color: Colors.deepOrange,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      widget.category,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Quantity:',
                                      style: TextStyle(
                                          color: Colors.deepOrange,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      widget.quantity,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Text(
                              'Description',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              widget.desc,
                              style: TextStyle(
                                  color: Colors.black,
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 10),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            // Text(
                            //   'Photos',
                            //   style: TextStyle(
                            //       color: Colors.black,
                            //       fontWeight: FontWeight.bold,
                            //       fontSize: 14),
                            // ),
                            // SizedBox(
                            //   height: 10,
                            // ),
                            // Text(
                            //   'No photos available',
                            //   style: TextStyle(
                            //       color: Colors.black,
                            //       // fontWeight: FontWeight.bold,
                            //       fontSize: 10),
                            // ),
                            // SizedBox(
                            //   height: 50,
                            // ),
                            Center(
                              child: GestureDetector(
                                // onTap: () async {
                                //   var _url = 'tel:${user.mobile}';

                                // },
                                onTap: () async {
                                  // var individual = user
                                  //     .where((element) => element.uid == widget.user)
                                  //     .first;
                                  print(user.mobile);
                                  var _url = 'tel:${user.mobile}';
                                  await canLaunch(_url)
                                      ? await launch(_url)
                                      : throw 'Could not launch $_url';
                                },
                                child: Container(
                                  height: 40,
                                  // width: 120,
                                  decoration: BoxDecoration(
                                    color: Colors.deepOrangeAccent,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Interested to Donate?',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 70,
                            ),
                            Branding(),
                          ],
                        )),
                      ),
                    ),
                  ],
                  mainAxisSize: MainAxisSize.min,
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
