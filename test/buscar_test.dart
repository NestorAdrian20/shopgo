import 'package:flutter_test/flutter_test.dart';
import 'package:shopgo/src/map/maps.dart';

void main() {
  group("Buscar", () {
    final maps = MapsGeolocator();
    test("Envio de datos", () {
      expect(() async => await maps.createState(), isA<List>());
    });
  });
}
