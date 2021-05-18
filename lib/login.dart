import 'package:easydonatefinal/widgets/field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
                label: 'Email',
                controller: emailController,
              ),
              Field(
                label: 'Password',
                controller: passwordController,
              ),
              widget.isSignup
                  ? Field(
                      label: 'Confirm Password',
                      controller: confirmPasswordController,
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
                    onPressed: () {},
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
