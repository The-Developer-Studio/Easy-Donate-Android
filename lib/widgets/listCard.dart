import 'package:flutter/material.dart';

class ListCard extends StatefulWidget {
  @required
  final String title;
  @required
  final String postedTime;
  @required
  final String location;

  const ListCard({Key key, this.title, this.postedTime, this.location})
      : super(key: key);
  @override
  _ListCardState createState() => _ListCardState();
}

class _ListCardState extends State<ListCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Card(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text(widget.title), Text(widget.postedTime)],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.location),
                Text(
                  'View',
                  style: TextStyle(color: Colors.orange),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
