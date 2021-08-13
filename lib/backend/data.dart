import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easydonatefinal/backend/controllers.dart';
import 'package:easydonatefinal/models/category.dart';
import 'package:easydonatefinal/models/faq.dart';
import 'package:easydonatefinal/models/item.dart';
import 'package:easydonatefinal/models/user.dart';
import 'package:easydonatefinal/widgets/itemTile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
        request.get('user'),
        request.id,
        request.get('image'));
  }).toList();
}

List<Faq> _faqFromSnapshot(QuerySnapshot snapshot) {
  return snapshot.docs.map((faq) {
    return Faq(faq.get('question'), faq.get('answer'));
  }).toList();
}

List<Category> _categoriesFromSnapshot(QuerySnapshot snapshot) {
  return snapshot.docs.map((category) {
    return Category(category.get('name'), category.get('icon'));
  }).toList();
}

List<UserDetails> _userFromSnapshot(QuerySnapshot snapshot) {
  return snapshot.docs.map((user) {
    return UserDetails(
        user.get('address'),
        user.get('email'),
        user.get('location'),
        user.get('mobile'),
        user.get('name'),
        user.get('uid'));
  }).toList();
}

Stream<List<Item>> get requests {
  return FirebaseFirestore.instance
      .collection('Request')
      .orderBy('postedTime', descending: true)
      .snapshots()
      .map(_itemListFromSnapshot);
}

Stream<List<Item>> get donations {
  return FirebaseFirestore.instance
      .collection('Donation')
      .orderBy('postedTime', descending: true)
      .snapshots()
      .map(_itemListFromSnapshot);
}

Stream<List<Category>> get categories {
  return FirebaseFirestore.instance
      .collection('categories')
      .snapshots()
      .map(_categoriesFromSnapshot);
}

Stream<List<UserDetails>> get userDetails {
  return FirebaseFirestore.instance
      .collection('userDetails')
      .snapshots()
      .map(_userFromSnapshot);
}

Stream<List<Faq>> get faqList {
  return FirebaseFirestore.instance
      .collection('FAQs')
      .snapshots()
      .map(_faqFromSnapshot);
}

Stream<List<Item>> get userDonation {
  return FirebaseFirestore.instance
      .collection('Donation')
      .where('user', isEqualTo: FirebaseAuth.instance.currentUser.uid)
      .snapshots()
      .map(_itemListFromSnapshot);
}

Stream<List<Item>> get userRequest {
  return FirebaseFirestore.instance
      .collection('Request')
      .where('user', isEqualTo: FirebaseAuth.instance.currentUser.uid)
      .snapshots()
      .map(_itemListFromSnapshot);
}

// ignore: missing_return
String duration(Timestamp time) {
  var difference = Timestamp.now().toDate().difference(time.toDate());

  var minutesDifference = difference.inMinutes;
  var hoursDifference = difference.inHours;
  var daysDifference = difference.inDays;

  if (minutesDifference < 60) {
    if (minutesDifference == 1) {
      return '$minutesDifference min ago';
    }
    return '$minutesDifference mins ago';
  }
  if (minutesDifference > 60) {
    if (hoursDifference == 1) {
      return '$hoursDifference hour ago';
    }
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
    if (daysDifference >= 7 && daysDifference <= 13) {
      return '${daysDifference ~/ 7} week ago';
    }
    if (daysDifference >= 14 && daysDifference <= 30) {
      return '${daysDifference ~/ 7} weeks ago';
    }
    if (daysDifference > 30 && daysDifference < 60) {
      return '${daysDifference ~/ 30} month ago';
    }
    if (daysDifference >= 60 && daysDifference < 365) {
      return '${daysDifference ~/ 30} months ago';
    }
    if (daysDifference >= 365 && daysDifference < 730) {
      return '${daysDifference ~/ 365} year ago';
    }
    if (daysDifference >= 730) {
      return '${daysDifference ~/ 365} years ago';
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
                            isDonation: !isRequest,
                            item: request,
                          ))
                      .toList(),
                ),
                ListView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: result2
                      .map<ItemTile>((request) => ItemTile(
                            isDonation: !isRequest,
                            item: request,
                          ))
                      .toList(),
                ),
                ListView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: result3
                      .map<ItemTile>((request) => ItemTile(
                            isDonation: isRequest,
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

showMyDialog(BuildContext context, String id, String collection) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          'Delete post',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text(
                'This action will delete the post permenantly, you cant restore the post after deletion.',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text(
              'Cancel',
              style:
                  TextStyle(color: Colors.black45, fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text(
              'Delete',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              FirebaseFirestore.instance
                  .collection(collection)
                  .doc(id)
                  .delete();
              clearControllers();
              Fluttertoast.showToast(msg: 'Post Deleted');
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

DateTime currentDate;

showEditDialog(BuildContext context, Item item, String collection) async {
  return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        nameController.text = item.title;
        descController.text = item.desc;
        quantityController.text = item.quantity;
        currentDate = item.time.toDate();
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text(
                'Edit Post',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              content: SingleChildScrollView(
                child: ListBody(
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(hintText: 'Name'),
                    ),
                    TextField(
                      controller: descController,
                      decoration: InputDecoration(hintText: 'Description'),
                    ),
                    TextField(
                      controller: quantityController,
                      decoration: InputDecoration(hintText: 'Quantity'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${currentDate.toLocal()}".split(' ')[0],
                        ),
                        IconButton(
                            onPressed: () async {
                              final DateTime pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: currentDate,
                                  firstDate: DateTime(2015),
                                  lastDate: DateTime(2050));
                              if (pickedDate != null &&
                                  pickedDate != currentDate) {
                                setState(() {
                                  currentDate = pickedDate;
                                });
                              }
                            },
                            icon: Icon(Icons.calendar_today))
                      ],
                    )
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                        color: Colors.black45, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text(
                    'Confirm',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    FirebaseFirestore.instance
                        .collection(collection)
                        .doc(item.id)
                        .update({
                      'title': nameController.text,
                      'desc': descController.text,
                      'quantity': quantityController.text,
                      'time': currentDate,
                    });
                    clearControllers();
                    Fluttertoast.showToast(msg: 'Post Edited');
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      });
}

clearControllers() {
  donorNameController.clear();
  donorAddressController.clear();
  cityController.clear();
  countryController.clear();
  descController.clear();
  quantityController.clear();
  emailController.clear();
  passwordController.clear();
  confirmPasswordController.clear();
  addressController.clear();
  mobileController.clear();
  nameController.clear();
}
