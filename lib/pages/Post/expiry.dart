import 'package:easydonatefinal/models/postModel.dart';
import 'package:easydonatefinal/pages/Post/review.dart';
import 'package:easydonatefinal/widgets/branding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpiryPage extends StatefulWidget {
  @override
  _ExpiryPageState createState() => _ExpiryPageState();
}

class _ExpiryPageState extends State<ExpiryPage> {
  Color _containerColor1 = Colors.deepOrange;
  Color _containerColor2 = Colors.white;
  Color _containertext1 = Colors.white;
  Color _containertext2 = Colors.deepOrange;
  bool isExpirable = true;
  DateTime currentDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
      });
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
          padding: const EdgeInsets.only(top: 20.0, left: 25, right: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.category == 'Food'
                    ? 'Choose expiry'
                    : 'Choose Availability',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Tell us until when your donation is available. If not limited to time choose unlimited.',
                style: TextStyle(
                    fontSize: 12,
                    // fontWeight: FontWeight.bold,
                    color: Colors.black45),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 25.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isExpirable = true;
                    });
                    _selectDate(context);
                  },
                  child: Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.deepOrange),
                      color: isExpirable ? _containerColor1 : _containerColor2,
                    ),
                    height: 50,
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${currentDate.toLocal()}".split(' ')[0],
                          style: TextStyle(
                              color: isExpirable
                                  ? _containertext1
                                  : _containertext2,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "  (Click to change date)",
                          style: TextStyle(
                              color: isExpirable
                                  ? _containertext1
                                  : _containertext2,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
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
                      isExpirable = false;
                    });
                  },
                  child: Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.deepOrange,
                      ),
                      color: !isExpirable ? _containerColor1 : _containerColor2,
                    ),
                    height: 50,
                    child: Center(
                        child: Text(
                      'Proceed with no expiry date',
                      style: TextStyle(
                          color:
                              !isExpirable ? _containertext1 : _containertext2,
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
                    if (isExpirable)
                      post.expiry = currentDate;
                    else
                      post.expiry = null;
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ReviewPage()),
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
