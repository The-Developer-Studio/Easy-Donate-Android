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
  Color _containertext2 = Colors.black87;
  Color _temp, _temp2;

  DateTime currentDate = DateTime.now();

  void changeColor() {
    setState(() {
      _temp = _containerColor1;
      _containerColor1 = _containerColor2;
      _containerColor2 = _temp;

      _temp2 = _containertext1;
      _containertext1 = _containertext2;
      _containertext2 = _temp2;
    });
  }

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
                'Choose expiry',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Tell us until your donation is available. If not limited to time choose unlimited.',
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
                    _selectDate(context);
                    changeColor();
                  },
                  child: Container(
                    width: 500,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(),
                      color: _containerColor1,
                    ),
                    height: 50,
                    child: currentDate == null
                        ? Center(
                            child: Text(
                            'Choose from calender',
                            style: TextStyle(
                                color: _containertext1,
                                fontWeight: FontWeight.bold),
                          ))
                        : Center(
                            child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${currentDate.toLocal()}".split(' ')[0],
                                style: TextStyle(
                                    color: _containertext1,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "  (Click to change date)",
                                style: TextStyle(
                                    color: _containertext1,
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
                  onTap: changeColor,
                  child: Container(
                    width: 500,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(),
                      color: _containerColor2,
                    ),
                    height: 50,
                    child: Center(
                        child: Text(
                      'Proceed with no expiry date',
                      style: TextStyle(
                          color: _containertext2, fontWeight: FontWeight.bold),
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
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => BasicDetails()),
                    // );
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
