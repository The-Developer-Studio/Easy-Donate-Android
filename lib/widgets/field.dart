import 'package:flutter/material.dart';

class Field extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final bool ispass;
  const Field({Key key, this.label, this.controller, this.ispass})
      : super(key: key);
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
            obscureText: widget.ispass,
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

class CustomField extends StatefulWidget {
  final String labeltext;
  final TextEditingController controller;
  CustomField({Key key, this.labeltext, this.controller}) : super(key: key);

  @override
  _CustomFieldState createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      style: TextStyle(fontSize: 13),
      decoration: InputDecoration(hintText: widget.labeltext),
    );
  }
}
