import 'package:flutter/material.dart';

class Field extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final bool ispass;
  final bool isNumber;
  final bool isAddress;
  const Field(
      {Key key,
      this.label,
      this.controller,
      this.ispass,
      this.isNumber,
      this.isAddress})
      : super(key: key);
  @override
  _FieldState createState() => _FieldState();
}

class _FieldState extends State<Field> {
  bool visible;
  @override
  void initState() {
    visible = widget.ispass;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
          height: 70,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.black12)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Some Text';
                    }
                    return null;
                  },
                  keyboardType: keyboardType(
                      address: widget.isAddress, phone: widget.isNumber),
                  obscureText: visible,
                  controller: widget.controller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: widget.label,
                    labelStyle: TextStyle(fontSize: 14),
                  ),
                ),
              ),
              widget.ispass
                  ? IconButton(
                      icon: Icon(
                        Icons.remove_red_eye,
                        color: !visible ? Colors.black : Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          visible = !visible;
                        });
                      },
                    )
                  : Container(),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}

TextInputType keyboardType({bool phone, bool address}) {
  if (phone) {
    return TextInputType.phone;
  } else if (address) {
    return TextInputType.streetAddress;
  } else {
    return TextInputType.text;
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
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please Enter Some Text';
        }
        return null;
      },
      controller: widget.controller,
      style: TextStyle(fontSize: 13),
      decoration: InputDecoration(hintText: widget.labeltext),
    );
  }
}
