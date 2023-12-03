// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i21;
import 'package:flutter/material.dart' as _i22;
import 'package:shopgo/src/location/location.dart' as _i4;
import 'package:shopgo/src/map/map.dart' as _i8;
import 'package:shopgo/src/map/maps.dart' as _i9;
import 'package:shopgo/src/payments/stripe/payments.dart' as _i11;
import 'package:shopgo/src/privacy_page.dart' as _i12;
import 'package:shopgo/src/screens/404/screen_404_.dart' as _i16;
import 'package:shopgo/src/screens/auth/login.dart' as _i7;
import 'package:shopgo/src/screens/auth/register.dart' as _i14;
import 'package:shopgo/src/screens/auth/resert_password.dart' as _i15;
import 'package:shopgo/src/screens/home/components/detail_populars_screen.dart'
    as _i1;
import 'package:shopgo/src/screens/home/components/form/form_screen.dart'
    as _i20;
import 'package:shopgo/src/screens/home/components/packages/form_entregar_paquetes.dart'
    as _i2;
import 'package:shopgo/src/screens/home/components/packages/form_recibir_paquetes.dart'
    as _i3;
import 'package:shopgo/src/screens/home/components/search_bar.dart' as _i17;
import 'package:shopgo/src/screens/home/components/service_detail_screen.dart'
    as _i18;
import 'package:shopgo/src/screens/home/home_biker/home_biker_screen.dart'
    as _i5;
import 'package:shopgo/src/screens/home/home_customer/home_customer_screen.dart'
    as _i6;
import 'package:shopgo/src/screens/onboarding/onboarding_screen_.dart' as _i10;
import 'package:shopgo/src/screens/splash/splash_screen_.dart' as _i19;
import 'package:shopgo/src/screens/users/profile_screen.dart' as _i13;

abstract class $AppRouter extends _i21.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i21.PageFactory> pagesMap = {
    DetailPolularsRoute.name: (routeData) {
      final args = routeData.argsAs<DetailPolularsRouteArgs>();
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.DetailPolularsScreen(
          args.category,
          args.description,
          args.imageUrl,
          key: args.key,
        ),
      );
    },
    FormDeliverPackage.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.FormDeliverPackage(),
      );
    },
    FormReceivePackage.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.FormReceivePackage(),
      );
    },
    GeolocatorWidget.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.GeolocatorWidget(),
      );
    },
    HomeBikerRoute.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.HomeBikerScreen(),
      );
    },
    HomeCustomerRoute.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.HomeCustomerScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.LoginPage(),
      );
    },
    MapApp.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.MapApp(),
      );
    },
    MapsGeolocator.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.MapsGeolocator(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.OnboardingScreen(),
      );
    },
    Payments.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.Payments(),
      );
    },
    PrivacyRoute.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.PrivacyPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.ProfileScreen(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.RegisterScreen(),
      );
    },
    ResetRoute.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.ResetPage(),
      );
    },
    Route404.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.Screen404(),
      );
    },
    SearchBar_.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.SearchBar_(),
      );
    },
    Shoes.name: (routeData) {
      final args = routeData.argsAs<ShoesArgs>();
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i18.Shoes(
          key: args.key,
          image: args.image,
          tag: args.tag,
        ),
      );
    },
    SplashRoute.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.SplashScreen(),
      );
    },
    TextFormFieldRoute.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i20.TextFormFieldScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.DetailPolularsScreen]
class DetailPolularsRoute extends _i21.PageRouteInfo<DetailPolularsRouteArgs> {
  DetailPolularsRoute({
    required String category,
    required String description,
    required String imageUrl,
    _i22.Key? key,
    List<_i21.PageRouteInfo>? children,
  }) : super(
          DetailPolularsRoute.name,
          args: DetailPolularsRouteArgs(
            category: category,
            description: description,
            imageUrl: imageUrl,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailPolularsRoute';

  static const _i21.PageInfo<DetailPolularsRouteArgs> page =
      _i21.PageInfo<DetailPolularsRouteArgs>(name);
}

class DetailPolularsRouteArgs {
  const DetailPolularsRouteArgs({
    required this.category,
    required this.description,
    required this.imageUrl,
    this.key,
  });

  final String category;

  final String description;

  final String imageUrl;

  final _i22.Key? key;

  @override
  String toString() {
    return 'DetailPolularsRouteArgs{category: $category, description: $description, imageUrl: $imageUrl, key: $key}';
  }
}

/// generated route for
/// [_i2.FormDeliverPackage]
class FormDeliverPackage extends _i21.PageRouteInfo<void> {
  const FormDeliverPackage({List<_i21.PageRouteInfo>? children})
      : super(
          FormDeliverPackage.name,
          initialChildren: children,
        );

  static const String name = 'FormDeliverPackage';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i3.FormReceivePackage]
class FormReceivePackage extends _i21.PageRouteInfo<void> {
  const FormReceivePackage({List<_i21.PageRouteInfo>? children})
      : super(
          FormReceivePackage.name,
          initialChildren: children,
        );

  static const String name = 'FormReceivePackage';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i4.GeolocatorWidget]
class GeolocatorWidget extends _i21.PageRouteInfo<void> {
  const GeolocatorWidget({List<_i21.PageRouteInfo>? children})
      : super(
          GeolocatorWidget.name,
          initialChildren: children,
        );

  static const String name = 'GeolocatorWidget';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i5.HomeBikerScreen]
class HomeBikerRoute extends _i21.PageRouteInfo<void> {
  const HomeBikerRoute({List<_i21.PageRouteInfo>? children})
      : super(
          HomeBikerRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeBikerRoute';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i6.HomeCustomerScreen]
class HomeCustomerRoute extends _i21.PageRouteInfo<void> {
  const HomeCustomerRoute({List<_i21.PageRouteInfo>? children})
      : super(
          HomeCustomerRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeCustomerRoute';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i7.LoginPage]
class LoginRoute extends _i21.PageRouteInfo<void> {
  const LoginRoute({List<_i21.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i8.MapApp]
class MapApp extends _i21.PageRouteInfo<void> {
  const MapApp({List<_i21.PageRouteInfo>? children})
      : super(
          MapApp.name,
          initialChildren: children,
        );

  static const String name = 'MapApp';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i9.MapsGeolocator]
class MapsGeolocator extends _i21.PageRouteInfo<void> {
  const MapsGeolocator({List<_i21.PageRouteInfo>? children})
      : super(
          MapsGeolocator.name,
          initialChildren: children,
        );

  static const String name = 'MapsGeolocator';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i10.OnboardingScreen]
class OnboardingRoute extends _i21.PageRouteInfo<void> {
  const OnboardingRoute({List<_i21.PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i11.Payments]
class Payments extends _i21.PageRouteInfo<void> {
  const Payments({List<_i21.PageRouteInfo>? children})
      : super(
          Payments.name,
          initialChildren: children,
        );

  static const String name = 'Payments';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i12.PrivacyPage]
class PrivacyRoute extends _i21.PageRouteInfo<void> {
  const PrivacyRoute({List<_i21.PageRouteInfo>? children})
      : super(
          PrivacyRoute.name,
          initialChildren: children,
        );

  static const String name = 'PrivacyRoute';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i13.ProfileScreen]
class ProfileRoute extends _i21.PageRouteInfo<void> {
  const ProfileRoute({List<_i21.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i14.RegisterScreen]
class RegisterRoute extends _i21.PageRouteInfo<void> {
  const RegisterRoute({List<_i21.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i15.ResetPage]
class ResetRoute extends _i21.PageRouteInfo<void> {
  const ResetRoute({List<_i21.PageRouteInfo>? children})
      : super(
          ResetRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResetRoute';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i16.Screen404]
class Route404 extends _i21.PageRouteInfo<void> {
  const Route404({List<_i21.PageRouteInfo>? children})
      : super(
          Route404.name,
          initialChildren: children,
        );

  static const String name = 'Route404';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i17.SearchBar_]
class SearchBar_ extends _i21.PageRouteInfo<void> {
  const SearchBar_({List<_i21.PageRouteInfo>? children})
      : super(
          SearchBar_.name,
          initialChildren: children,
        );

  static const String name = 'SearchBar_';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i18.Shoes]
class Shoes extends _i21.PageRouteInfo<ShoesArgs> {
  Shoes({
    _i22.Key? key,
    required String image,
    required String tag,
    List<_i21.PageRouteInfo>? children,
  }) : super(
          Shoes.name,
          args: ShoesArgs(
            key: key,
            image: image,
            tag: tag,
          ),
          initialChildren: children,
        );

  static const String name = 'Shoes';

  static const _i21.PageInfo<ShoesArgs> page = _i21.PageInfo<ShoesArgs>(name);
}

class ShoesArgs {
  const ShoesArgs({
    this.key,
    required this.image,
    required this.tag,
  });

  final _i22.Key? key;

  final String image;

  final String tag;

  @override
  String toString() {
    return 'ShoesArgs{key: $key, image: $image, tag: $tag}';
  }
}

/// generated route for
/// [_i19.SplashScreen]
class SplashRoute extends _i21.PageRouteInfo<void> {
  const SplashRoute({List<_i21.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i20.TextFormFieldScreen]
class TextFormFieldRoute extends _i21.PageRouteInfo<void> {
  const TextFormFieldRoute({List<_i21.PageRouteInfo>? children})
      : super(
          TextFormFieldRoute.name,
          initialChildren: children,
        );

  static const String name = 'TextFormFieldRoute';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}
