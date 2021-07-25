import 'package:easydonatefinal/backend/data.dart';
import 'package:easydonatefinal/models/item.dart';
import 'package:easydonatefinal/pages/showdetails.dart';
import 'package:flutter/material.dart';

import 'listCard.dart';

class ItemTile extends StatelessWidget {
  final bool isDonation;
  final Item item;

  const ItemTile({Key key, @required this.item, @required this.isDonation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ShowDetails(
                    isDonation: isDonation,
                    item: item,
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
