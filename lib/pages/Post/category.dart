import 'package:easydonatefinal/backend/data.dart';
import 'package:easydonatefinal/models/postModel.dart';

import 'donationdetails.dart';
import 'package:easydonatefinal/widgets/branding.dart';
import 'package:easydonatefinal/widgets/categorytile.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 25, right: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select a category',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
              SizedBox(
                height: 40,
              ),
              StreamBuilder(
                  stream: getCategories(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3),
                          shrinkWrap: true,
                          itemCount: snapshot.data.size,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                post.category =
                                    snapshot.data.docs[index]['name'];
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DonationDetails()),
                                );
                              },
                              child: Container(
                                child: Row(
                                  children: [
                                    Container(),
                                    CategoryTile(
                                      icondata: IconData(
                                          snapshot.data.docs[index]['icon'],
                                          fontFamily: 'MaterialIcons'),
                                      label: snapshot.data.docs[index]['name'],
                                    ),
                                    Container()
                                  ],
                                ),
                              ),
                            );
                          });
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  }),
              SizedBox(
                height: 60,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DonationDetails()),
                    );
                  },
                  child: Container(
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.deepOrangeAccent,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Center(
                      child: Text(
                        'Next',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 150,
              ),
              Center(child: Branding()),
            ],
          ),
        ),
      ),
    );
  }
}
