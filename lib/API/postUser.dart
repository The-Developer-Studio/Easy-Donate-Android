import 'dart:convert';
import 'package:http/http.dart' as http;

Future<http.Response> adduser(String uid, String email, String name,
    String address, String mobile, String location) async {
  var url = 'https://easy-donate-api.herokuapp.com/user/create';

  Map data = {
    "Address": address,
    "Email": email,
    "Location": location,
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
