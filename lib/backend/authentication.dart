import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easydonatefinal/backend/controllers.dart';
import 'package:easydonatefinal/backend/data.dart';
import 'package:easydonatefinal/pages/login.dart';
import 'package:easydonatefinal/widgets/bottomNavigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Stream authcheck() {
  return FirebaseAuth.instance.authStateChanges().asBroadcastStream();
}

authRegister(BuildContext context) async {
  try {
    assert(emailController.text.trim() != '' && emailController.text != null);
    assert(passwordController.text.trim() != '' &&
        passwordController.text != null);
    assert(confirmPasswordController.text.trim() != '' &&
        confirmPasswordController.text != null);
    assert(nameController.text.trim() != '' && nameController.text != null);
    assert(
        addressController.text.trim() != '' && addressController.text != null);
    assert(cityController.text.trim() != '' && cityController.text != null);
    assert(
        countryController.text.trim() != '' && countryController.text != null);
    assert(mobileController.text.trim() != '' && mobileController.text != null);
    if (passwordController.text == confirmPasswordController.text) {
      var result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      var uid = result.user.uid;
      FirebaseFirestore.instance.collection('userDetails').add({
        "uid": uid,
        "email": emailController.text,
        "name": nameController.text,
        "address": addressController.text,
        "mobile": mobileController.text,
        "location": '${cityController.text},${countryController.text}'
      });
      clearControllers();
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) => Login(
                    isSignup: false,
                  )),
          (route) => false);
    } else {
      Fluttertoast.showToast(msg: 'Entered Passwords do not match');
    }
  } on AssertionError {
    Fluttertoast.showToast(msg: 'None of the Fields can be Empty');
  } on FirebaseAuthException catch (e) {
    Fluttertoast.showToast(msg: e.message);
  }
}

authLogin(BuildContext context) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
    clearControllers();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => BottomNavigation()),
        (route) => false);
  } on FirebaseAuthException catch (e) {
    Fluttertoast.showToast(msg: e.message);
  }
}
