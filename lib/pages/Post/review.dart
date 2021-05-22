import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easydonatefinal/backend/data.dart';
import 'package:easydonatefinal/models/postModel.dart';
import 'package:easydonatefinal/pages/Post/success.dart';
import 'package:flutter/material.dart';

class ReviewPage extends StatefulWidget {
  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text(post.type),
              Text(post.donorName),
              Text(post.donorAddress),
              Text(post.city),
              Text(post.country),
              Text(post.category),
              Text(post.productName),
              Text(post.description),
              Text(post.quantity.toString()),
              Text(post.expiry.toString())
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FirebaseFirestore.instance.collection('${post.type}').add({
            "donorName": post.donorName,
            "donorAddress": post.donorAddress,
            "location": "${post.city},${post.country}",
            "category": post.category,
            "title": post.productName,
            "desc": post.description,
            "quantity": post.quantity,
            "time": post.expiry,
            "postedTime": DateTime.now()
          });
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => SuccessPage()));
        },
      ),
    );
  }
}
