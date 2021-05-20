import 'package:flutter/material.dart';

class CategoryTile extends StatefulWidget {
  final String label;
  final IconData icondata;

  const CategoryTile({Key key, this.label, this.icondata}) : super(key: key);

  @override
  _CategoryTileState createState() => _CategoryTileState();
}

class _CategoryTileState extends State<CategoryTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
            widget.icondata,
            color: Colors.white,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            widget.label,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
