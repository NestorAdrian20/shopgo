import 'package:auto_route/auto_route.dart';
import 'app_route.gr.dart';
//part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: Route404.page),
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: OnboardingRoute.page),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: RegisterRoute.page),
        AutoRoute(page: HomeBikerRoute.page),
        AutoRoute(page: HomeCustomerRoute.page),
        AutoRoute(page: ProfileRoute.page),
        AutoRoute(page: TextFormFieldRoute.page),
        AutoRoute(page: RegisterRoute.page),
        AutoRoute(page: ResetRoute.page),
        AutoRoute(page: PrivacyRoute.page),
        AutoRoute(page: FormDeliverPackage.page),
        AutoRoute(page: FormReceivePackage.page),
        AutoRoute(page: Payments.page),
        AutoRoute(page: MapsGeolocator.page),
        AutoRoute(page: OrderTrackingRoute.page),
        AutoRoute(page: PedidosCustomerRoute.page),
        AutoRoute(page: CardServicesCustomer.page),
        AutoRoute(page: HomeBikerRouteServices.page),
        AutoRoute(page: CardServicesEPBiker.page),
        AutoRoute(page: OrderTrackingRoute.page),
        AutoRoute(page: OrderTrackingRouteCopy.page)
      ];
}
