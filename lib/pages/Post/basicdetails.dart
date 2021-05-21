import 'package:easydonatefinal/models/postModel.dart';
import 'package:easydonatefinal/pages/Post/category.dart';
import 'package:easydonatefinal/widgets/branding.dart';
import 'package:easydonatefinal/widgets/field.dart';
import 'package:flutter/material.dart';

class BasicDetails extends StatefulWidget {
  @override
  _BasicDetailsState createState() => _BasicDetailsState();
}

class _BasicDetailsState extends State<BasicDetails> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController donorNameController =
        new TextEditingController();
    final TextEditingController donorAddressController =
        new TextEditingController();
    final TextEditingController cityController = new TextEditingController();
    final TextEditingController countryController = new TextEditingController();
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
                'Basic details',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
              SizedBox(
                height: 40,
              ),
              CustomField(
                controller: donorNameController,
                labeltext: "Name of Donor",
              ),
              SizedBox(
                height: 20,
              ),
              CustomField(
                controller: donorAddressController,
                labeltext: "Address of Donor",
              ),
              SizedBox(
                height: 20,
              ),
              CustomField(
                controller: cityController,
                labeltext: "City",
              ),
              SizedBox(
                height: 20,
              ),
              CustomField(
                controller: countryController,
                labeltext: "Country",
              ),
              SizedBox(
                height: 60,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    try {
                      assert(donorAddressController.text.trim() != '');
                      assert(donorNameController.text.trim() != '');
                      assert(cityController.text.trim() != '');
                      assert(countryController.text.trim() != '');
                      post.donorName = donorNameController.text;
                      post.donorAddress = donorAddressController.text;
                      post.city = cityController.text;
                      post.country = countryController.text;
                      print(post.type);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CategoryPage()),
                      );
                    } on AssertionError {
                      print('Check the Fields');
                    }
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
