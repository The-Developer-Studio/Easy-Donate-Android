import 'package:flutter/cupertino.dart';
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
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 7),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.postedTime,
                    style: TextStyle(fontSize: 10, color: Colors.black45),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 12,
                        color: Colors.black45,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text(
                        widget.location,
                        style: TextStyle(fontSize: 12, color: Colors.black45),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'View',
                        style: TextStyle(
                            color: Colors.orange,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Icon(
                        Icons.arrow_forward,
                        size: 12,
                        color: Colors.deepOrange,
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
