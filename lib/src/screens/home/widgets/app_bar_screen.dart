import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopgo/config/routes/app_route.gr.dart';

class AppBarShopGo extends StatelessWidget {
  const AppBarShopGo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('ShopGo'),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset('assets/icons/profile.svg'),
          tooltip: 'Profile',
          onPressed: () async {
            await AutoRouter.of(context).push(const ProfileRoute());
          },
        ),
      ],
    );
  }
}
