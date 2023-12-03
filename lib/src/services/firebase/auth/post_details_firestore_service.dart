import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:shopgo/src/screens/auth/login.dart';

final _auth = FirebaseAuth.instance;

postDetailsToFirestore(String email, String rool, String plan,
    String emailController, BuildContext context) async {
  var user = _auth.currentUser;
  CollectionReference ref = FirebaseFirestore.instance.collection('users');

  ref
      .doc(user!.uid)
      .set({'email': emailController, 'rool': rool, 'plan': plan});
}
