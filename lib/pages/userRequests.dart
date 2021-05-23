import 'package:easydonatefinal/backend/data.dart';
import 'package:easydonatefinal/pages/showdetails.dart';
import 'package:easydonatefinal/widgets/listCard.dart';
import 'package:flutter/material.dart';

class UserRequests extends StatefulWidget {
  @override
  _UserRequestsState createState() => _UserRequestsState();
}

class _UserRequestsState extends State<UserRequests> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              'Request history',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              'Please review your details before posting. Anyways you can edit the post even after posting!',
              style: TextStyle(
                  fontSize: 12,
                  // fontWeight: FontWeight.bold,
                  color: Colors.black45),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          StreamBuilder(
            stream: getUserRequests(),
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data.size,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ShowDetails(
                                        category: snapshot.data.docs[index]
                                            ['category'],
                                        desc: snapshot.data.docs[index]['desc'],
                                        location: snapshot.data.docs[index]
                                            ['location'],
                                        quantity: snapshot.data.docs[index]
                                            ['quantity'],
                                      )),
                            );
                          },
                          child: ListCard(
                            location: snapshot.data.docs[index]['location'],
                            postedTime: duration(
                                snapshot.data.docs[index]['postedTime']),
                            title: snapshot.data.docs[index]['title'],
                          ),
                        );
                      })
                  : Center(
                      child: CircularProgressIndicator(),
                    );
            },
          ),
        ],
      ),
    );
  }
}
