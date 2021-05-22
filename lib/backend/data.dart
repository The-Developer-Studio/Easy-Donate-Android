import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

getRequests() {
  return FirebaseFirestore.instance.collection('Request').snapshots();
}

getDonations() {
  return FirebaseFirestore.instance.collection('Donation').snapshots();
}

getCategories() {
  return FirebaseFirestore.instance.collection('categories').snapshots();
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
