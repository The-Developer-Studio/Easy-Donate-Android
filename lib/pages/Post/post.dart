import 'package:easydonatefinal/models/postModel.dart';
import 'package:easydonatefinal/pages/Post/basicdetails.dart';
import 'package:easydonatefinal/widgets/branding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostNew extends StatefulWidget {
  @override
  _PostNewState createState() => _PostNewState();
}

class _PostNewState extends State<PostNew> {
  Color _containerColor1 = Colors.deepOrange;
  Color _containerColor2 = Colors.white;
  Color _containertext1 = Colors.white;
  Color _containertext2 = Colors.deepOrange;

  @override
  void initState() {
    post.type = 'Donation';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 25),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Choose your type',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 25.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      post.type = 'Donation';
                    });
                  },
                  child: Container(
                    width: 500,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(),
                      color: post.type == 'Donation'
                          ? _containerColor1
                          : _containerColor2,
                    ),
                    height: 50,
                    child: Center(
                        child: Text(
                      'I am ready to donate',
                      style: TextStyle(
                          color: post.type == 'Donation'
                              ? _containertext1
                              : _containertext2,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 25.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      post.type = 'Request';
                    });
                  },
                  child: Container(
                    width: 500,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(),
                      color: post.type == 'Request'
                          ? _containerColor1
                          : _containerColor2,
                    ),
                    height: 50,
                    child: Center(
                        child: Text(
                      'I need something',
                      style: TextStyle(
                          color: post.type == 'Request'
                              ? _containertext1
                              : _containertext2,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BasicDetails()),
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
                height: 130,
              ),
              Branding(),
            ],
          ),
        ),
      ),
    );
  }
}
