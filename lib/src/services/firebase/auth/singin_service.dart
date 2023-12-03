import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopgo/src/services/firebase/auth/route_service.dart';

void signIn(String email, String password, GlobalKey<FormState> formkey,
    BuildContext context) //async
{
  if (formkey.currentState!.validate()) {
    try {
      // ignore: unused_local_variable
      //UserCredential userCredential =
      //await
      FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      route(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // ignore: avoid_print
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        // ignore: avoid_print
        print('Wrong password provided for that user.');
      }
    }
  }
}
