import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

Future<http.Response> adduser(String uid, String email, String name,
    String address, String mobile, String location, String country) async {
  var url = 'https://easy-donate-api.herokuapp.com/user/create';

  Map data = {
    "Address": address,
    "Email": email,
    "Location": '$location' + ', ' + '$country',
    "Mobile": mobile,
    "Name": name,
    "UID": uid,
  };
  //encode Map to JSON
  var body = json.encode(data);

  var response = await http.post(Uri.parse(url),
      headers: {"Content-Type": "application/json"}, body: body);
  print("${response.statusCode}");
  print("${response.body}");
  return response;
}

class Users {
  final String address;
  final String email;
  final String location;
  final String mobile;
  final String name;

  Users({
    this.address,
    this.email,
    this.location,
    this.mobile,
    this.name,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      address: json['Address'],
      email: json['Email'],
      location: json['Location'],
      mobile: json['Mobile'],
      name: json['Name'],
    );
  }
}

Future<Users> fetchUser() async {
  final String url = 'https://easy-donate-api.herokuapp.com/user/';
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
    return Users.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
