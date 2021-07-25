import 'package:cached_network_image/cached_network_image.dart';
import 'package:easydonatefinal/backend/data.dart';
import 'package:easydonatefinal/models/item.dart';
import 'package:easydonatefinal/models/user.dart';
import 'package:easydonatefinal/widgets/branding.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ShowDetails extends StatefulWidget {
  final Item item;
  final bool isDonation;
  const ShowDetails({
    Key key,
    @required this.item,
    @required this.isDonation,
  }) : super(key: key);
  @override
  _ShowDetailsState createState() => _ShowDetailsState();
}

class _ShowDetailsState extends State<ShowDetails> {
  UserDetails user;
  @override
  Widget build(BuildContext context) {
    userDetails.listen((users) {
      setState(() {
        user = users.where((element) => element.uid == widget.item.user).first;
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
                              child: Text(widget.item.donorName[0]),
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
                                      widget.item.location,
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
                              children: [
                                Text(
                                  'Item: ',
                                  style: TextStyle(
                                      color: Colors.deepOrange,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  widget.item.title,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Type: ',
                                      style: TextStyle(
                                          color: Colors.deepOrange,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      widget.item.category,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Quantity: ',
                                      style: TextStyle(
                                          color: Colors.deepOrange,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      widget.item.quantity,
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
                              widget.item.desc,
                              style: TextStyle(
                                  color: Colors.black,
                                  // fontWei5ght: FontWeight.bold,
                                  fontSize: 13),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            widget.isDonation
                                ? Text(
                                    'Photos',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  )
                                : Container(),
                            widget.isDonation
                                ? SizedBox(
                                    height: 10,
                                  )
                                : Container(),
                            widget.isDonation
                                ? Center(
                                    child: widget.item.url != null
                                        ? Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Container(
                                              width: 300,
                                              height: 300,
                                              child: CachedNetworkImage(
                                                imageUrl: widget.item.url,
                                              ),
                                            ),
                                          )
                                        : Padding(
                                            padding: const EdgeInsets.all(18.0),
                                            child: Text('No image selected'),
                                          ),
                                  )
                                : Container(),
                            SizedBox(
                              height: 50,
                            ),
                            Center(
                              child: GestureDetector(
                                //
                                onTap: () async {
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
                                      'Contact ' + user.name,
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
