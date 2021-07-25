import 'package:cloud_firestore/cloud_firestore.dart';

class Item {
  final String category;
  final String desc;
  final String donorAddress;
  final String donorName;
  final String location;
  final Timestamp postedTime;
  final String quantity;
  final Timestamp time;
  final String title;
  final String user;
  final String id;
  final String url;
  Item(
      this.category,
      this.desc,
      this.donorAddress,
      this.donorName,
      this.location,
      this.postedTime,
      this.quantity,
      this.time,
      this.title,
      this.user,
      this.id,
      this.url);
}
