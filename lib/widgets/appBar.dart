import 'dart:ui';

import 'package:easydonatefinal/backend/data.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final bool isRequest;
  const CustomAppBar({
    Key key,
    @required this.isRequest,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 250.0,
      collapsedHeight: 90,

      floating: false,
      // pinned: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: GestureDetector(
              onTap: () {
                showSearch(
                    context: context,
                    delegate: ItemSearch(isRequest: isRequest));
              },
              child: Container(
                height: 35,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 2,
                      offset: const Offset(0, 1),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    'Search Anything',
                    style: TextStyle(color: Colors.black87, fontSize: 8),
                  ),
                ),
              ),
            ),
          ),
          background: Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: Stack(
              children: [
                Container(
                  // height: 100,
                  decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(80),
                          bottomRight: Radius.circular(80))),
                ),
                Positioned(
                  left: 45,
                  top: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Save a life',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20),
                          ),
                          Text(
                            'today!',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            'find people who',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 12),
                          ),
                          Text(
                            'needs a donation.',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 12),
                          ),
                        ],
                      ),
                      Image.asset(
                        'images/header.png',
                        height: 130,
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
