import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Stream authcheck() {
  return FirebaseAuth.instance.authStateChanges().asBroadcastStream();
}

authRegister(String email, String password, BuildContext context) async {
  try {
    var result = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return result.user.uid;
  } on FirebaseAuthException catch (e) {
    Fluttertoast.showToast(msg: e.message);
  }
}

authLogin(String email, String password, BuildContext context) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (e) {
    Fluttertoast.showToast(msg: e.message);
  }
}
