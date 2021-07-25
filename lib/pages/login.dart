import 'package:easydonatefinal/backend/authentication.dart';
import 'package:easydonatefinal/backend/controllers.dart';
import 'package:easydonatefinal/widgets/field.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                        if (_formKey.currentState.validate()) {
                          if (widget.isSignup) {
                            authRegister(context);
                          } else {
                            authLogin(context);
                          }
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
                SizedBox(
                  height: 30,
                ),
                widget.isSignup
                    ? Container()
                    : Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Forgot Password? ',
                              style: TextStyle(fontSize: 14.0),
                            ),
                            GestureDetector(
                              onTap: () {
                                _showDialog(context);
                              },
                              child: Text(
                                'Reset',
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
      ),
    );
  }

  _showDialog(BuildContext context) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Reset Password'),
            content: Field(
              isAddress: false,
              isNumber: false,
              label: 'Email',
              controller: emailController,
              ispass: false,
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel')),
              TextButton(
                  onPressed: () async {
                    try {
                      await FirebaseAuth.instance
                          .sendPasswordResetEmail(email: emailController.text);
                      Navigator.of(context).pop();
                    } on FirebaseAuthException catch (e) {
                      Fluttertoast.showToast(msg: e.message);
                    }
                  },
                  child: Text('Reset'))
            ],
          );
        });
  }
}
