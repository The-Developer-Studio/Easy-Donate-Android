import 'package:flutter/material.dart';

import '../backend/data.dart';

class RequestsList extends StatefulWidget {
  @override
  _RequestsListState createState() => _RequestsListState();
}

class _RequestsListState extends State<RequestsList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: getRequests(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data.size,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Card(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(snapshot.data.docs[index]['title']),
                            Text(duration(
                                snapshot.data.docs[index]['postedTime']))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(snapshot.data.docs[index]['location']),
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
              });
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
