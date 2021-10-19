import 'dart:convert';

import 'package:http/http.dart' as http;

class Post {
  final String Address;
  final String Email;
  final String Location;
  final String Mobile;
  // final String Country;
  final String Name;
  final String UID;

  Post(
      {this.Address,
      this.Email,
      this.Location,
      this.Mobile,
      // this.Country,
      this.Name,
      this.UID});

  factory Post.fromJson(Map json) {
    return Post(
      Address: json['Address'],
      Email: json['Email'],
      Location: json['Location'],
      Mobile: json['Mobile'],
      // Country: json['Country'],
      Name: json['Name'],
      UID: json['UID'],
    );
  }

  Map toMap() {
    var map = new Map();
    map["Address"] = Address;
    map["Email"] = Email;
    map["Location"] = Location;
    map["Mobile"] = Mobile;
    // map["Country"] = Country;
    map["Name"] = Name;
    map["UID"] = UID;

    return map;
  }
}

Future createPost(String url, {Map body}) async {
  print(url);
  print(body);
  return http.post(
    Uri.parse(url),
    body: body,
    headers: <String, String>{
      'connection': 'keep-alive',
      // 'Content-type': 'application/json',
    },
  ).then((http.Response response) {
    final int statusCode = response.statusCode;

    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }
    return Post.fromJson(json.decode(response.body));
  });
}

// Future<http.Response> createUser(String address, String email, String location,
//     String mobile, String name, String uid, String country) {
//   print("Post API triggered");
//   return http.post(
//     Uri.parse('https://easy-donate-api.herokuapp.com/user/create/'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, String>{
//       "Address": address,
//       "Email": email,
//       "Location": '$location,$country',
//       "Mobile": mobile,
//       "Name": name,
//       "UID": uid,
//     }),
//   );
// }
 