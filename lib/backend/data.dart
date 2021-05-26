import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easydonatefinal/models/category.dart';
import 'package:easydonatefinal/models/item.dart';
import 'package:easydonatefinal/widgets/itemTile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

getCategories() {
  return FirebaseFirestore.instance.collection('categories').snapshots();
}

List<Item> _itemListFromSnapshot(QuerySnapshot snapshot) {
  return snapshot.docs.map((request) {
    return Item(
        request.get('category'),
        request.get('desc'),
        request.get('donorAddress'),
        request.get('donorName'),
        request.get('location'),
        request.get('postedTime'),
        request.get('quantity'),
        request.get('time'),
        request.get('title'),
        request.get('user'));
  }).toList();
}

List<Category> _categoriesFromSnapshot(QuerySnapshot snapshot) {
  return snapshot.docs.map((category) {
    return Category(category.get('name'), category.get('icon'));
  }).toList();
}

Stream<List<Item>> get requests {
  return FirebaseFirestore.instance
      .collection('Request')
      .snapshots()
      .map(_itemListFromSnapshot);
}

Stream<List<Item>> get donations {
  return FirebaseFirestore.instance
      .collection('Donation')
      .snapshots()
      .map(_itemListFromSnapshot);
}

Stream<List<Category>> get categories {
  return FirebaseFirestore.instance
      .collection('categories')
      .snapshots()
      .map(_categoriesFromSnapshot);
}

getUserDonations() {
  return FirebaseFirestore.instance
      .collection('Donation')
      .where('user', isEqualTo: FirebaseAuth.instance.currentUser.uid)
      .snapshots();
}

getUserRequests() {
  return FirebaseFirestore.instance
      .collection('Request')
      .where('user', isEqualTo: FirebaseAuth.instance.currentUser.uid)
      .snapshots();
}

getUserDetails() {
  return FirebaseFirestore.instance
      .collection('userDetails')
      .where("uid", isEqualTo: FirebaseAuth.instance.currentUser.uid)
      .snapshots();
}

// ignore: missing_return
String duration(Timestamp time) {
  var difference = Timestamp.now().toDate().difference(time.toDate());

  var minutesDifference = difference.inMinutes;
  var hoursDifference = difference.inHours;
  var daysDifference = difference.inDays;

  if (minutesDifference < 60) {
    return '$minutesDifference mins ago';
  }
  if (minutesDifference > 60) {
    if (hoursDifference < 24) {
      return '$hoursDifference hours ago';
    }
  }
  if (hoursDifference >= 24) {
    if (daysDifference == 0) {
      return 'Today';
    }
    if (daysDifference == 1) {
      return 'Yesterday';
    }
    if (daysDifference > 1 && daysDifference < 7) {
      return '$daysDifference days ago';
    }
    if (daysDifference >= 7 && daysDifference <= 30) {
      return '${daysDifference / 7} weeks ago';
    }
    if (daysDifference > 30 && daysDifference < 365) {
      return '${daysDifference / 30} months ago';
    }
    if (daysDifference >= 365) {
      return '${daysDifference / 365} years ago';
    }
  }
}

class ItemSearch extends SearchDelegate {
  final bool isRequest;

  ItemSearch({this.isRequest});
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.close)),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return StreamBuilder(
        stream: isRequest ? requests : donations,
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Text('No Data!!'),
            );
          }
          final result1 = snapshot.data.where((Item request) =>
              request.title.toLowerCase().contains(query.toLowerCase()));
          final result2 = snapshot.data.where((Item request) =>
              request.category.toLowerCase().contains(query.toLowerCase()));
          final result3 = snapshot.data.where((Item request) =>
              request.location.toLowerCase().contains(query.toLowerCase()));
          return SingleChildScrollView(
            child: Column(
              children: [
                ListView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: result1
                      .map<ItemTile>((request) => ItemTile(
                            item: request,
                          ))
                      .toList(),
                ),
                ListView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: result2
                      .map<ItemTile>((request) => ItemTile(
                            item: request,
                          ))
                      .toList(),
                ),
                ListView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: result3
                      .map<ItemTile>((request) => ItemTile(
                            item: request,
                          ))
                      .toList(),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
