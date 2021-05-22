import 'package:flutter/foundation.dart';

class PostModel extends ChangeNotifier {
  String type;
  String donorName;
  String donorAddress;
  String city;
  String country;
  String category;
  String productName;
  String description;
  String quantity;
  DateTime expiry;
  PostModel() {
    type = '';
    donorName = '';
    donorAddress = '';
    city = '';
    country = '';
    category = '';
    productName = '';
    description = '';
    quantity = '';
    expiry = DateTime.now();
  }
}

final post = new PostModel();
