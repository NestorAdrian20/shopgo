import 'package:shopgo/src/services/firebase/firestore/firestore_service.dart';
import 'package:flutter/material.dart';

class EditNamePage extends StatefulWidget {
  const EditNamePage({super.key});

  @override
  State<EditNamePage> createState() => _EditNamePageState();
}

class _EditNamePageState extends State<EditNamePage> {
  TextEditingController nameController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    nameController.text = arguments['nombre'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Name'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration:
                  const InputDecoration(hintText: 'Ingrese la modificación'),
            ),
            ElevatedButton(
                onPressed: () async {
                  await updateServicio(arguments['uid'], nameController.text)
                      .then((_) => {Navigator.pop(context)});
                },
                child: const Text('Actualizar')),
          ],
        ),
      ),
    );
  }
}
