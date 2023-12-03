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
          IconButton(
            icon: SvgPicture.asset('assets/icons/profile.svg'),
            tooltip: 'Profile',
            onPressed: () async {
              await AutoRouter.of(context).push(const ProfileRoute());
            },
          ),
        ],
      ),
      body: servicesList(),
      /*floatingActionButton: FloatingActionButton(
          onPressed: () async {
            FirebaseAuth.instance.authStateChanges().listen((User? user) {
              if (user != null) {
                // ignore: avoid_print
                print("********");
                print(user.uid);
                print("********");
              }
            });
            //AutoRouter.of(context).push(const TextFormFieldRoute());

            setState(() {});
          },
          child: const Icon(Icons.add),
        )*/
    );
  }

  FutureBuilder<List<dynamic>> servicesList() {
    return FutureBuilder(
        future: getServices(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  onDismissed: (direction) async {
                    //await deletePeople(snapshot.data?[index]['uid']);
                    snapshot.data?.removeAt(index);
                  },
                  confirmDismiss: (direction) async {
                    bool result = false;
                    result = await showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                                '¿Estas seguro de querer eliminar a ${snapshot.data?[index]["category"]}?'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    return Navigator.pop(context, false);
                                  },
                                  child: const Text(
                                    'Cancelar',
                                    style: TextStyle(color: Colors.red),
                                  )),
                              TextButton(
                                  onPressed: () {
                                    return Navigator.pop(context, true);
                                  },
                                  child: const Text('Si, estoy seguro'))
                            ],
                          );
                        });
                    return result;
                  },
                  background: Container(
                    color: Colors.red,
                    child: const Icon(Icons.delete),
                  ),
                  direction: DismissDirection.startToEnd,
                  key: Key(snapshot.data?[index]['uid']),
                  child: Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: const Icon(Icons.album),
                          title: Text('${snapshot.data?[index]['category']}:'),
                          subtitle: Text(
                              'Estado : ${snapshot.data?[index]['state']} \n Tipo: ${snapshot.data?[index]['type']} \n Descripción: ${snapshot.data?[index]['descripction']} \n Dirección de recibo: ${snapshot.data?[index]['addressReceive']} \n Dirección de entrega: ${snapshot.data?[index]['addressDeliver']}'),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            //******************* */
                            if (snapshot.data?[index]['state'] ==
                                "Pendiente") ...[
                              TextButton(
                                child: const Text('Realizar'),
                                onPressed: () {
                                  String idBiker =
                                      (FirebaseAuth.instance.currentUser?.uid)
                                          .toString();
                                  String uid =
                                      (snapshot.data?[index]['uid']).toString();
                                  updateServicios(uid, idBiker);
                                  setState(() {});
                                },
                              ),
                            ] else ...[
                              const Icon(
                                Icons.moped_sharp,
                                size: 40,
                                color: Colors.black,
                              )
                            ],
                            //******************************** */

                            /*TextButton(
                              child: const Text('Realizar'),
                              onPressed: () {
                                String idBiker =
                                    (FirebaseAuth.instance.currentUser?.uid)
                                        .toString();
                                String uid =
                                    (snapshot.data?[index]['uid']).toString();
                                updateServicios(uid, idBiker);
                                setState(() {});
                              },
                            ),*/
                            const SizedBox(width: 8),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
