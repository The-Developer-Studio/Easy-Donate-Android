import 'dart:io';

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
  File image;
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
    image = File('');
  }
}

final post = new PostModel();
