import 'dart:convert';
import 'package:http/http.dart' as http;

Future<http.Response> addPost(
    String donorName,
    String donorAddress,
    String city,
    String country,
    String category,
    String productName,
    String description,
    String quantity,
    String expiry,
    String imgUrl,
    String uid,
    String postedTime,
    String isDonation) async {
  var url = 'https://easy-donate-api.herokuapp.com/donations/add/';

  if (imgUrl == null) imgUrl = "null";

  Map data = {
    "UID": uid,
    // "did": uid,
    "Category": category,
    "isDonation": isDonation,
    "Description": description,
    "donor_address": donorAddress,
    "donor_name": donorName,
    "location": '$city' + ', ' + '$country',
    "postedtime": postedTime,
    "expirytime": expiry,
    "quantity": quantity,
    "title": productName,
    // "user": uid,
    "image": imgUrl
  };
  //encode Map to JSON
  var body = json.encode(data);

  var response = await http.post(Uri.parse(url),
      headers: {"Content-Type": "application/json"}, body: body);
  print("${response.statusCode}");
  print("${response.body}");
  return response;
}
