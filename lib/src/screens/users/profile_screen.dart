import 'package:flutter/material.dart';
import '../../services/firebase/auth/logout_service.dart';
import 'components/profile_menu.dart';
import 'components/profile_pic.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  //static String routeName = "/profile";

  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Perfil"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            const ProfilePic(),
            const SizedBox(height: 20),
            ProfileMenu(
              text: "Mi cuenta",
              icon: "assets/icons/userIcon.svg",
              press: () => {},
            ),
            ProfileMenu(
              text: "Notificaciones",
              icon: "assets/icons/bell.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "Configuración",
              icon: "assets/icons/settings.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "Ayuda",
              icon: "assets/icons/questionMark.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "Salir",
              icon: "assets/icons/logOut.svg",
              press: () {
                logout(context);
                // Navigator.pushNamedAndRemoveUntil(
                //   context,
                //   '/home', // Ruta de la pantalla de inicio (HomeScreen)
                //   (route) => false,
                // ); // Elimina todas las rutas anteriores
              },
            ),
          ],
        ),
      ),
    );
  }
}
