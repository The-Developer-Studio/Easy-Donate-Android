import 'package:cloud_firestore/cloud_firestore.dart';

class Donation {
  final String donorName;
  final String donorAddress;
  final String location;
  final String category;
  final String title;
  final String desc;
  final String quantity;
  final Timestamp time;
  final Timestamp postedTime;

  Donation(this.donorName, this.donorAddress, this.location, this.category,
      this.title, this.desc, this.quantity, this.time, this.postedTime);
}



// "donorName": post.donorName,
//             "donorAddress": post.donorAddress,
//             "location": "${post.city},${post.country}",
//             "category": post.category,
//             "title": post.productName,
//             "desc": post.description,
//             "quantity": post.quantity,
//             "time": post.expiry,
//             "postedTime": DateTime.now()