// To parse this JSON data, do
//
//     final item = itemFromJson(jsonString);

import 'dart:convert';

Item itemFromJson(String str) => Item.fromJson(json.decode(str));

String itemToJson(Item data) => json.encode(data.toJson());

class Item {
  Item({
    this.description,
    this.uid,
    this.category,
    this.donorAddress,
    this.location,
    this.expirytime,
    this.title,
    this.did,
    this.isDonation,
    this.donorName,
    this.postedtime,
    this.quantity,
    this.image,
  });

  String description;
  String uid;
  String category;
  String donorAddress;
  String location;
  String expirytime;
  String title;
  int did;
  String isDonation;
  String donorName;
  String postedtime;
  String quantity;
  String image;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        description: json["Description"],
        uid: json["UID"],
        category: json["Category"],
        donorAddress: json["donor_address"],
        location: json["location"],
        expirytime: json["expirytime"],
        title: json["title"],
        did: json["did"],
        isDonation: json["isDonation"],
        donorName: json["donor_name"],
        postedtime: json["postedtime"],
        quantity: json["quantity"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "Description": description,
        "UID": uid,
        "Category": category,
        "donor_address": donorAddress,
        "location": location,
        "expirytime": expirytime,
        "title": title,
        "did": did,
        "isDonation": isDonation,
        "donor_name": donorName,
        "postedtime": postedtime,
        "quantity": quantity,
        "image": image,
      };
}
