// import 'package:flutter_test/flutter_test.dart';
// import 'package:shopgo/src/services/firebase/firestore/firestore_service.dart';

// void main() {
//   group("Conexión con firebase", () {
//     test("Agregar pedido firebase", () {
//       String category = "TestCategory";
//       String idCustomer = "TestIdCustomer";
//       String type = "TestType";
//       String descripction = "TestDescription";
//       String addressReceive = "TestAdressReceive";
//       String addressDeliver = "TestDeliver";

//       expect(
//         () async => await addServicios(category, idCustomer, descripction, type,
//             addressReceive, addressDeliver),
//         isA<void>(),
//       );
//     });

//     test("Update servicios firebase", () {
//       String uid = "TestUID";
//       String idBiker = "TestIdBiker";

//       expect(
//         () async => await updateServicio(uid, idBiker),
//         isA<void>(),
//       );
//     });
//     test("Agregar categorias", () {
//       String name = "TestName";
//       String description = "TestDescription";

//       expect(() async => await addCategoria(name, description), isA<void>());
//     });
//     test("Recuperar datos", () {
//       expect(() async => await getServices(), isA<void>());
//     });
//     test("Recuperar datos", () {
//       expect(() async => await getCategories(), isA<void>());
//     });
//   });
// }
