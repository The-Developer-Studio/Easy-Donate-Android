import 'package:flutter/material.dart';

class Field extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  const Field({Key key, this.label, this.controller}) : super(key: key);
  @override
  _FieldState createState() => _FieldState();
}

class _FieldState extends State<Field> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
          height: 70,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.black12)),
          child: TextField(
            obscureText: true,
            controller: widget.controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: widget.label,
              labelStyle: TextStyle(fontSize: 14),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
