import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easydonatefinal/backend/authentication.dart';
import 'package:easydonatefinal/backend/controllers.dart';
import 'package:easydonatefinal/widgets/bottomNavigation.dart';
import 'package:easydonatefinal/widgets/field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';

// Login Screen and SignUp Screen
class Login extends StatefulWidget {
  final bool isSignup;

  const Login({Key key, this.isSignup}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    var emailController = new TextEditingController();
    var passwordController = new TextEditingController();
    var confirmPasswordController = new TextEditingController();
    var nameController = new TextEditingController();
    var addressController = new TextEditingController();
    var mobileController = new TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              Center(
                child: Image.asset(
                  'images/logo.png',
                  height: 100,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                widget.isSignup
                    ? 'Create your Account'
                    : 'Login to your Account',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              SizedBox(
                height: 30,
              ),
              Field(
                isAddress: false,
                isNumber: false,
                label: 'Email',
                controller: emailController,
                ispass: false,
              ),
              Field(
                isAddress: false,
                isNumber: false,
                label: 'Password',
                controller: passwordController,
                ispass: true,
              ),
              widget.isSignup
                  ? Field(
                      isAddress: false,
                      isNumber: false,
                      label: 'Confirm Password',
                      controller: confirmPasswordController,
                      ispass: true,
                    )
                  : Container(),
              widget.isSignup
                  ? Field(
                      isAddress: false,
                      isNumber: false,
                      label: 'Name',
                      controller: nameController,
                      ispass: false,
                    )
                  : Container(),
              widget.isSignup
                  ? Field(
                      isAddress: true,
                      isNumber: false,
                      label: 'Address',
                      controller: addressController,
                      ispass: false,
                    )
                  : Container(),
              widget.isSignup
                  ? Field(
                      isAddress: false,
                      isNumber: false,
                      label: 'City',
                      controller: cityController,
                      ispass: false,
                    )
                  : Container(),
              widget.isSignup
                  ? Field(
                      isAddress: false,
                      isNumber: false,
                      label: 'Country',
                      controller: countryController,
                      ispass: false,
                    )
                  : Container(),
              widget.isSignup
                  ? Field(
                      isAddress: false,
                      isNumber: true,
                      label: 'Mobile Number',
                      controller: mobileController,
                      ispass: false,
                    )
                  : Container(),
              Center(
                child: Container(
                  width: 500,
                  height: 50,
                  // margin: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextButton(
                    child: Text(
                      widget.isSignup ? 'Sign Up' : 'Sign in',
                      style: TextStyle(fontSize: 14.0, color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.deepOrangeAccent),
                    ),
                    onPressed: () async {
                      if (widget.isSignup) {
                        try {
                          assert(emailController.text.trim() != '' &&
                              emailController.text != null);
                          assert(passwordController.text.trim() != '' &&
                              passwordController.text != null);
                          assert(confirmPasswordController.text.trim() != '' &&
                              confirmPasswordController.text != null);
                          assert(nameController.text.trim() != '' &&
                              nameController.text != null);
                          assert(addressController.text.trim() != '' &&
                              addressController.text != null);
                          assert(cityController.text.trim() != '' &&
                              cityController.text != null);
                          assert(countryController.text.trim() != '' &&
                              countryController.text != null);
                          assert(mobileController.text.trim() != '' &&
                              mobileController.text != null);
                          if (passwordController.text ==
                              confirmPasswordController.text) {
                            var uid = await authRegister(emailController.text,
                                passwordController.text, context);
                            FirebaseFirestore.instance
                                .collection('userDetails')
                                .add({
                              "uid": uid,
                              "email": emailController.text,
                              "name": nameController.text,
                              "address": addressController.text,
                              "mobile": mobileController.text,
                              "location":
                                  '${cityController.text},${countryController.text}'
                            });
                            emailController.text = null;
                            passwordController.text = null;
                            confirmPasswordController.text = null;
                            nameController.text = null;
                            addressController.text = null;
                            mobileController.text = null;
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => Login(
                                          isSignup: false,
                                        )),
                                (route) => false);
                          } else {
                            Fluttertoast.showToast(
                                msg: 'Entered Passwords do not match');
                          }
                        } on AssertionError {
                          Fluttertoast.showToast(
                              msg: 'None of the Fields can be Empty');
                        }
                      } else {
                        authLogin(emailController.text, passwordController.text,
                            context);
                        emailController.text = null;
                        passwordController.text = null;
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => BottomNavigation()),
                            (route) => false);
                      }
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              widget.isSignup
                  ? Container()
                  : Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Dont have an account? ',
                            style: TextStyle(fontSize: 14.0),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Login(
                                        isSignup: true,
                                      )));
                            },
                            child: Text(
                              'Sign up ',
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepOrange),
                            ),
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
