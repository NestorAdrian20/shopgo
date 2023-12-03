import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopgo/src/services/firebase/auth/post_details_firestore_service.dart';

final _auth = FirebaseAuth.instance;

void signUp(
    String email,
    String password,
    String rool,
    String plan,
    String emailController,
    BuildContext context,
    GlobalKey<FormState> formkey) async {
  const CircularProgressIndicator();
  if (formkey.currentState!.validate()) {
    await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => {
              postDetailsToFirestore(
                  email, rool, plan, emailController, context)
            })
        // ignore: body_might_complete_normally_catch_error
        .catchError((e) {});
  }
}
