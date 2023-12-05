// ignore_for_file: must_be_immutable

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopgo/src/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../location/determine_position.dart';
import '../../../services/firebase/firestore/firestore_service.dart';

@RoutePage()
class DetailPolularsScreen extends StatefulWidget {
  final String category;
  final String _description;
  final String _imageUrl;

  const DetailPolularsScreen(this.category, this._description, this._imageUrl,
      {super.key});

  @override
  State<DetailPolularsScreen> createState() => _DetailPolularsScreenState();
}

class _DetailPolularsScreenState extends State<DetailPolularsScreen> {
  TextEditingController descripctionController =
      TextEditingController(text: "");

  TextEditingController direccionReciboController =
      TextEditingController(text: "");

  TextEditingController direccionEntregaController =
      TextEditingController(text: "");
  var options = [
    'Entregar',
    'Recibir',
  ];

  var _currentItemSelected = "Recibir";
  var type = "Recibir";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/banner.jpg'),
              alignment: Alignment.topCenter,
              fit: BoxFit.fitWidth,
            ),
          ),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(
                        'assets/icons/back.svg',
                        height: 18,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.24,
              ),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(50),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Image.asset(
                            widget._imageUrl,
                            height: 100,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                widget.category,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: kTitleTextColor,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                widget._description,
                                style: TextStyle(
                                  color: kTitleTextColor.withOpacity(0.7),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      const Text(
                        'Descripcion',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: kTitleTextColor,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Las entregas y recibos de packetes,\nrequerirá de una ubicación fija.',
                        style: TextStyle(
                          height: 1.6,
                          color: kTitleTextColor.withOpacity(0.7),
                        ),
                      ),
                      const Text(
                        'Servicios',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: kTitleTextColor,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Tipo : ",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                          DropdownButton<String>(
                            dropdownColor: Colors.green.shade300,
                            isDense: true,
                            isExpanded: false,
                            iconEnabledColor:
                                const Color.fromARGB(255, 28, 75, 30),
                            focusColor: const Color.fromARGB(255, 28, 75, 30),
                            items: options.map((String dropDownStringItem) {
                              return DropdownMenuItem<String>(
                                value: dropDownStringItem,
                                child: Text(
                                  dropDownStringItem,
                                  style: const TextStyle(
                                    color:
                                        const Color.fromARGB(255, 28, 75, 30),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (newValueSelected) {
                              setState(() {
                                _currentItemSelected = newValueSelected!;
                                type = newValueSelected;
                              });
                            },
                            value: _currentItemSelected,
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () async {
                          await _showMyDialog();
                        },
                        icon: const Icon(Icons.add),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const RadialGradient(
                      center: Alignment(-0.5, -0.6),
                      radius: 0.15,
                      colors: <Color>[
                        const Color.fromARGB(255, 28, 75, 30),
                        const Color.fromARGB(255, 28, 75, 30),
                      ],
                      stops: <double>[0.9, 1.0],
                    ),
                  ),
                  child: Row(
                    textDirection: TextDirection.rtl,
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            const Text('Recibir'),
                            const SizedBox(
                              height: 20,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: descripctionController,
                              decoration: const InputDecoration(
                                icon: Icon(Icons.person),
                                hintText: 'Escriba una brebe descripción',
                                labelText: 'Descripción',
                              ),
                              onSaved: (String? value) {
                                // This optional block of code can be used to run
                                // code when the user saves the form.
                              },
                              validator: (String? value) {
                                return (value != null && value.contains('@'))
                                    ? 'Do not use the @ char.'
                                    : null;
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: direccionReciboController,
                              decoration: const InputDecoration(
                                icon: Icon(Icons.person),
                                hintText: 'Ingrese la dirección',
                                labelText: 'Dirección de recibo',
                              ),
                              onSaved: (String? value) {
                                // This optional block of code can be used to run
                                // code when the user saves the form.
                              },
                              validator: (String? value) {
                                return (value != null && value.contains('@'))
                                    ? 'Do not use the @ char.'
                                    : null;
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: direccionEntregaController,
                              decoration: const InputDecoration(
                                icon: Icon(Icons.person),
                                hintText: 'Ingrese la dirección de entrega',
                                labelText: 'Dirección de entrega',
                              ),
                              onSaved: (String? value) {
                                // This optional block of code can be used to run
                                // code when the user saves the form.
                              },
                              validator: (String? value) {
                                return (value != null && value.contains('@'))
                                    ? 'Do not use the @ char.'
                                    : null;
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                String idCustomer =
                    (FirebaseAuth.instance.currentUser?.uid).toString();

                addServicios(
                    widget.category,
                    idCustomer,
                    type,
                    descripctionController.text,
                    direccionReciboController.text,
                    direccionEntregaController.text);
                determinePosition().then((value) {
                  double lat = value.latitude;
                  double long = value.longitude;
                  locationUsersPedidos(idCustomer, lat, long);
                });
                Navigator.of(context).pop();

                _showMyDialogConfirm();
              },
            ),
            TextButton(
              child: const Text('Not Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showMyDialogConfirm() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('En proceso'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Aceptar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
