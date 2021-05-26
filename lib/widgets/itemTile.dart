import 'package:easydonatefinal/backend/data.dart';
import 'package:easydonatefinal/models/item.dart';
import 'package:easydonatefinal/pages/showdetails.dart';
import 'package:flutter/material.dart';

import 'listCard.dart';

class ItemTile extends StatelessWidget {
  final Item item;

  const ItemTile({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ShowDetails(
                    category: item.category,
                    desc: item.desc,
                    location: item.location,
                    quantity: item.quantity,
                  )),
        );
      },
      child: ListCard(
        location: item.location,
        postedTime: duration(item.postedTime),
        title: item.title,
      ),
    );
  }
}
