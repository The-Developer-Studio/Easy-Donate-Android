import 'dart:convert';

import 'package:easydonatefinal/models/category.dart';
import 'package:http/http.dart' as http;

Future<List<Category>> fetchCategories() async {
  final String url = 'https://easy-donate-api.herokuapp.com/categories/';

  final response = await http.get(Uri.parse(url));
  print(response.statusCode);
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print(response.body);
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((job) => new Category.fromJson(job)).toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load FAQ');
  }
}
