import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shopgo/config/routes/app_route.gr.dart';
import 'package:shopgo/src/services/firebase/firestore/firestore_service.dart';

@RoutePage()
class FormDeliverPackage extends StatefulWidget {
  const FormDeliverPackage({
    super.key,
  });

  @override
  State<FormDeliverPackage> createState() => _TextFormFieldScreenState();
}

class _TextFormFieldScreenState extends State<FormDeliverPackage> {
  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController descripcionController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo Servicio'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Nombre",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                ),
                onChanged: (String name) {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: TextFormField(
                controller: descripcionController,
                decoration: const InputDecoration(
                  labelText: "Descripción",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                ),
                onChanged: (String name) {},
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(
                      onPressed: () async {
                        await addCategoria(
                          nameController.text,
                          descripcionController.text,
                        ).then((_) => {
                              AutoRouter.of(context)
                                  .push(const HomeCustomerRoute())
                            });
                        //2018-11-29T19:41:26-08:00
                      },
                      child: const Text('Guardar')),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
