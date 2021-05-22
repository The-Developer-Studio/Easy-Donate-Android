import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easydonatefinal/models/donationModel.dart';
import 'package:provider/provider.dart';

getRequests() {
  return FirebaseFirestore.instance.collection('Request').snapshots();
}

getDonations() {
  return FirebaseFirestore.instance.collection('Donation').snapshots();
}

getCategories() {
  return FirebaseFirestore.instance.collection('categories').snapshots();
}

HashMap<String, Donation> donationsList = HashMap<String, Donation>();
final donationStream =
    FirebaseFirestore.instance.collection('Donation').snapshots();
cachingDonation() {
  donationStream.listen((event) {
    for (int i = 0; i < event.size; i++) {
      if (!donationsList.containsKey(event.docs[i].id)) {
        donationsList[event.docs[i].id] = Donation(
            event.docs[i]['donorName'],
            event.docs[i]['donorAddress'],
            event.docs[i]['location'],
            event.docs[i]['category'],
            event.docs[i]['title'],
            event.docs[i]['desc'],
            event.docs[i]['quantity'].toString(),
            event.docs[i]['time'],
            event.docs[i]['postedTime']);
      }
    }
  });
  print(donationsList);
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
