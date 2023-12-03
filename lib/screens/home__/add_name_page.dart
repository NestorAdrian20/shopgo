//import 'package:shopgo/src/services/firebase_service.dart';
import 'package:flutter/material.dart';

class AddNamePage extends StatefulWidget {
  const AddNamePage({super.key});

  @override
  State<AddNamePage> createState() => _AddNamePageState();
}

class _AddNamePageState extends State<AddNamePage> {
  TextEditingController nameController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Name'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(hintText: 'Enter Name'),
            ),
            ElevatedButton(
                onPressed: () async {
                  //await addServicio(nameController.text)
                  //.then((_) => {Navigator.pop(context)});
                },
                child: const Text('Guardar')),
          ],
        ),
      ),
    );
  }
}
