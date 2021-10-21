import 'dart:convert';

import 'package:easydonatefinal/models/item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

Future<List<Item>> fetchUserItems() async {
  final String url = 'https://easy-donate-api.herokuapp.com/donations/history/';
  final FirebaseAuth auth = FirebaseAuth.instance;
  final User user = auth.currentUser;
  final uid = user.uid;

  final response = await http.get(Uri.parse('$url' + '$uid'));
  print(response.statusCode);
  print(uid);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print(response.body);
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((job) => new Item.fromJson(job)).toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load FAQ');
  }
}

Future<List<Item>> get fetchUserRequest async {
  List<Item> totalList = await fetchUserItems();
  List<Item> requestList = [];
  totalList.forEach((element) {
    if (element.isDonation == "false") {
      requestList.add(element);
    }
  });
  return requestList;
}

Future<List<Item>> get fetchUserDonation async {
  List<Item> totalList = await fetchUserItems();
  List<Item> donationList = [];
  totalList.forEach((element) {
    if (element.isDonation == "true") {
      donationList.add(element);
    }
  });
  return donationList;
}
