// ignore_for_file: avoid_print

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

@RoutePage()
class Payments extends StatelessWidget {
  const Payments({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Payments'),
        ),
        body: TextButton(
            onPressed: () {
              createPaymentIntent();
            },
            child: const Text('Payments')));
  }
}

Map<String, dynamic>? paymentIntent;

createPaymentIntent() async {
  try {
    Map<String, dynamic> body = {"amount": "1000", "currency": "USD"};
    http.Response response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        body: body,
        headers: {
          "Authorization":
              "sk_test_51K2ONtBvtkjIYX1EXOudtACFubTBGmTz02zp6U6hjoDT1F4GBBIwiATC4RHUsNdD5oWIrthGuChtDLgQk9RnEBZK00j24Z0HPO",
          "Content-Type":
              "application/x-www-form-urlencoded", //"multipart/form-data"
        });
    return json.decode(response.body);
  } catch (e) {
    throw Exception(e.toString());
  }
}

void displayPaymentSheet() async {
  try {
    await Stripe.instance.presentCustomerSheet();
    print('Done');
  } catch (e) {
    print('Failed');
  }
}

void makePayment() async {
  try {
    paymentIntent = await createPaymentIntent();
    var gpay = const PaymentSheetGooglePay(
        merchantCountryCode: "US", currencyCode: "USD", testEnv: true);
    Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret: paymentIntent!["Client_secret"],
            style: ThemeMode.dark,
            merchantDisplayName: "Subir",
            googlePay: gpay));
  } catch (e) {
    print('Error: $e');
  }
}
