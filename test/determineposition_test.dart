import 'package:flutter_test/flutter_test.dart';
import 'package:shopgo/src/location/determine_position.dart';

void main() {
  group("Determinar posicisión", () {
    test("Posicisión", () {
      expect(() async => await determinePosition(), isA<void>());
    });
  });
}
