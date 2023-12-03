import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<void> addCategoria(String name, String description) async {
  await db
      .collection('services')
      .doc('szVtg3W6iBuu7Vx0HxVy')
      .collection('categories')
      .add({
    "name": name,
    "description": description,
    "state": "inactivo",
  });
}

//Borrar datos de firebase
Future<void> deletePeople(String uid) async {
  await db.collection('servicio').doc(uid).delete();
}

//Agregar servicios
Future<void> addServicios(
  String category,
  String idCustomer,
  String type,
  String descripction,
  String addressReceive,
  String addressDeliver,
) async {
  String dateRequest = (DateTime.now()).toString();
  String state = "Pendiente";

  await db
      .collection('services')
      .doc('szVtg3W6iBuu7Vx0HxVy')
      .collection('services')
      .add({
    "category": category,
    "idCustomer": idCustomer,
    "type": type,
    "descripction": descripction,
    "addressReceive": addressReceive,
    "addressDeliver": addressDeliver,
    "dateRequest": dateRequest,
    "state": state
  });
}

//Actualizar datos de firebase
Future<void> updateServicio(String uid, String nuevoNombre) async {
  await db.collection('servicio').doc(uid).set({"nombre": nuevoNombre});
}

//Actualizar datos de firebase
Future<void> updateServicios(String uid, String idBiker) async {
  //String dateCompleted = (DateTime.now()).toString();
  String state = "En proceso";

  await db
      .collection('services')
      .doc('szVtg3W6iBuu7Vx0HxVy')
      .collection('services')
      .doc(uid)
      .update({
    "idBiker": idBiker,
    //"dateCompleted": dateCompleted,
    "state": state
  });
}

Future<List> getServices() async {
  List service = [];
  CollectionReference collectionReferencePeople = db
      .collection('services')
      .doc('szVtg3W6iBuu7Vx0HxVy')
      .collection('services');

  QuerySnapshot querySnapshot = await collectionReferencePeople.get();

  for (var doc in querySnapshot.docs) {
    final data = doc.data() as Map<String, dynamic>;
    final services = {
      "uid": doc.id,
      "category": data['category'],
      "type": data['type'],
      "descripction": data['descripction'],
      "addressReceive": data['addressReceive'],
      "addressDeliver": data['addressDeliver'],
      "dateRequest": data['dateRequest'],
      "state": data['state'],
    };
    service.add(services);
  }

  return service;
}

Future<List> getCategories() async {
  List categories = [];
  CollectionReference collectionReferencePeople = db
      .collection('services')
      .doc('szVtg3W6iBuu7Vx0HxVy')
      .collection('categories');

  QuerySnapshot querySnapshot = await collectionReferencePeople.get();

  for (var doc in querySnapshot.docs) {
    final data = doc.data() as Map<String, dynamic>;
    final category = {
      "uid": doc.id,
      "name": data['name'],
      "description": data['description'],
      "state": data['state'],
    };
    categories.add(category);
  }
  return categories;
}

void checkUser() //async
{
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user != null) {
      // ignore: avoid_print
      print(user.uid);
    }
  });
}
