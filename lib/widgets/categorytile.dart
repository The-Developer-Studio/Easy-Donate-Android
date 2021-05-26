import 'package:easydonatefinal/models/category.dart';
import 'package:easydonatefinal/models/postModel.dart';
import 'package:easydonatefinal/pages/Post/donationdetails.dart';
import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final Category category;

  const CategoryTile({Key key, this.category}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        post.category = category.name;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DonationDetails()),
        );
      },
      child: Container(
        child: Row(
          children: [
            Container(),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    IconData(category.icon, fontFamily: 'MaterialIcons'),
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    category.name,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            Container()
          ],
        ),
      ),
    );
  }
}
