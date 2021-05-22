import 'package:easydonatefinal/pages/login.dart';
import 'package:easydonatefinal/widgets/bottomNavigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Stream authcheck() {
  return FirebaseAuth.instance.authStateChanges().asBroadcastStream();
}

authRegister(String email, String password, BuildContext context) async {
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
            builder: (context) => Login(
                  isSignup: false,
                )),
        (route) => false);
  } on FirebaseAuthException catch (e) {
    Fluttertoast.showToast(msg: e.message);
  }
}

authLogin(String email, String password, BuildContext context) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => BottomNavigation()),
        (route) => false);
  } on FirebaseAuthException catch (e) {
    Fluttertoast.showToast(msg: e.message);
  }
}
