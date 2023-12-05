// ignore_for_file: avoid_print

import 'package:shopgo/src/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import '../../../../config/routes/app_route.gr.dart';
import '../components/categoria_servicios_card.dart';
import '../components/populars_services_card.dart';
import '../widgets/app_bar_screen.dart';
import '../widgets/drawer_screen.dart';

@RoutePage()
class HomeCustomerScreen extends StatelessWidget {
  const HomeCustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerApp(),
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: AppBarShopGo(),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Categorias - Usuario',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kTitleTextColor,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              buildServicesList(context),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Servicios Populares - Usuario',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kTitleTextColor,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              buildServicesPopularList(),
            ],
          ),
        ),
      ),
    );
  }

  buildServicesList(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          const SizedBox(
            width: 30,
          ),
          TextButton(
              onPressed: () {
                AutoRouter.of(context).push(const PedidosCustomerRoute());
              },
              child: const Text('Ver estado del pedido')),
          const SizedBox(
            width: 30,
          ),
          const CategoriaServiciosCard(
            'Personalizar',
            'assets/icons/personalizar.png',
            greenColor,
          ),
          const SizedBox(
            width: 10,
          ),
          const CategoriaServiciosCard(
            'Entregas\nServicios',
            'assets/icons/package.png',
            greenColor,
          ),
          const SizedBox(
            width: 10,
          ),
          const CategoriaServiciosCard(
            'Pagos\nServicios',
            'assets/icons/payments.png',
            greenColor,
          ),
          const SizedBox(
            width: 30,
          ),
        ],
      ),
    );
  }

  buildServicesPopularList() {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        children: <Widget>[
          PopularsCard(
            'Paqueterias',
            'Entregar y Recicibir',
            'assets/images/package.png',
            greenColor,
          ),
          SizedBox(
            height: 20,
          ),
          PopularsCard(
            'Pagos',
            'Cobro y Pagos de servicios',
            'assets/images/pay.png',
            greenColor,
          ),
          SizedBox(
            height: 20,
          ),
          PopularsCard(
            'Compras',
            'Compras de utilidades',
            'assets/images/shop.png',
            greenColor,
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
