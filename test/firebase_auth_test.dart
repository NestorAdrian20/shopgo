/*import 'dart:js';

import 'package:flutter_test/flutter_test.dart';
import 'package:shopgo/src/services/firebase/auth/singup_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopgo/src/services/firebase/auth/post_details_firestore_service.dart';
import 'package:shopgo/src/screens/auth/register.dart';

void main() {
  group("Conexión con firebase", () {
    test("Recuperar datos", () {
      String email = "";
      String password = "";
      String rool = "";
      String plan = "";
      String emailController = "";
      expect(
        () async => await signUp(
            email, password, rool, plan, emailController, context, formKey ),
        isA<void>(),
      );
    });
  });
}
*/
import 'package:flutter_test/flutter_test.dart';
import 'package:shopgo/src/map/maps.dart';

void main() {
  group("Authentificación", () {
    final maps = MapsGeolocator();
    test("Login", () {
      expect(() async => await maps.createState(), isA<void>());
    });
    test("SinUp", () {
      expect(() async => await maps.createState(), isA<void>());
    });
    test("Cerrar sessión", () {
      expect(() async => await maps.createState(), isA<void>());
    });
  });
}
