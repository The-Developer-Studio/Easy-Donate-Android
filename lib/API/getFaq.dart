import 'dart:convert';
import 'package:http/http.dart' as http;

class FAQ {
  final String questions;
  final String answers;
  FAQ({this.questions, this.answers});

  factory FAQ.fromJson(Map<String, dynamic> json) {
    return FAQ(
      questions: json['questions'],
      answers: json['answers'],
    );
  }
}

Future<List<FAQ>> fetchFaq() async {
  final String url = 'https://easy-donate-api.herokuapp.com/faqs/';

  final response = await http.get(Uri.parse(url));
  print(response.statusCode);
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print(response.body);
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((job) => new FAQ.fromJson(job)).toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load FAQ');
  }
}
