import 'package:flutter/material.dart';
import 'package:shopgo/config/routes/app_route.dart';

class ShopGo extends StatelessWidget {
  const ShopGo({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AppRouter appRouter = AppRouter();
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter.config(),
    );
  }
}
