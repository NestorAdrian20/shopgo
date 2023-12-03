import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../screens/auth/login.dart';
//import '../auth/';

Future<void> logout(BuildContext context) async {
  const CircularProgressIndicator();
  await FirebaseAuth.instance.signOut();
  // ignore: use_build_context_synchronously
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => const LoginPage()));
  //Navigator.of(context)
  //.pushNamedAndRemoveUntil('/login', ModalRoute.withName('/'));
}
