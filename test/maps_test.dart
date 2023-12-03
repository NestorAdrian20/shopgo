import 'package:flutter_test/flutter_test.dart';
import 'package:shopgo/src/map/maps.dart';

void main() {
  group("Maps", () {
    final maps = MapsGeolocator();
    test("Posicisión", () {
      expect(() async => await maps.createState(), isA<void>());
    });
  });
}
