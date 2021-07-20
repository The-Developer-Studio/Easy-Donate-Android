import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easydonatefinal/backend/data.dart';
import 'package:easydonatefinal/models/postModel.dart';
import 'package:easydonatefinal/pages/Post/success.dart';
import 'package:easydonatefinal/widgets/branding.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ReviewPage extends StatefulWidget {
  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Review you details',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Please review your details before posting. Anyways you can edit the post even after posting!',
                style: TextStyle(
                    fontSize: 12,
                    // fontWeight: FontWeight.bold,
                    color: Colors.black45),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.donorName,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "${post.expiry.toLocal()}".split(' ')[0],
                        style: TextStyle(color: Colors.black54, fontSize: 12),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: 12,
                            color: Colors.black54,
                          ),
                          Row(
                            children: [
                              Text(
                                post.city,
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 12),
                              ),
                              Text(
                                ',',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 12),
                              ),
                              Text(
                                post.country,
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 12),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.deepOrange,
                    child: post.type == 'Donation' ? Text('D') : Text('R'),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Divider(
                height: 0.5,
                color: Colors.black45,
              ),
              SizedBox(
                height: 30,
              ),
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
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        post.category,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
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
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        post.quantity.toString(),
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
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    'Item name:',
                    style: TextStyle(
                        color: Colors.deepOrange, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    post.productName.toString(),
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
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
                post.description,
                style: TextStyle(
                    color: Colors.black,
                    // fontWeight: FontWeight.bold,
                    fontSize: 10),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                'Address',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                post.donorAddress,
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
                  onTap: () {
                    FirebaseFirestore.instance.collection('${post.type}').add({
                      "donorName": post.donorName,
                      "donorAddress": post.donorAddress,
                      "location": "${post.city},${post.country}",
                      "category": post.category,
                      "title": post.productName,
                      "desc": post.description,
                      "quantity": post.quantity,
                      "time": post.expiry,
                      "postedTime": DateTime.now(),
                      "user": FirebaseAuth.instance.currentUser.uid,
                    });
                    clearControllers();
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SuccessPage()));
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
                        'Confirm and post',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
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
          ),
        ),
      ),
    );
  }
}
