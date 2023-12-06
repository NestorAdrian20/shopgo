//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopgo/config/routes/app_route.gr.dart';
import 'package:shopgo/src/services/firebase/firestore/firestore_service.dart';
import 'package:auto_route/auto_route.dart';

import '../widgets/drawer_screen.dart';

@RoutePage()
class HomeBikerScreen extends StatefulWidget {
  const HomeBikerScreen({
    super.key,
  });

  @override
  State<HomeBikerScreen> createState() => _HomeBikerScreenState();
}

class _HomeBikerScreenState extends State<HomeBikerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerApp(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: null,
        title: const Text('ShopGo'),
        actions: <Widget>[
          TextButton(
              onPressed: () {
                AutoRouter.of(context).push(const HomeBikerRouteServices());
              },
              child: const Text('P')),
          TextButton(
              onPressed: () {
                AutoRouter.of(context).push(const CardServicesEPBiker());
              },
              child: const Text('EP')),
          IconButton(
            icon: SvgPicture.asset('assets/icons/profile.svg'),
            tooltip: 'Profile',
            onPressed: () async {
              await AutoRouter.of(context).push(const ProfileRoute());
            },
          ),
        ],
      ),
      body: const Center(child: Text('Inicio Motorista')),
    );
  }
}
