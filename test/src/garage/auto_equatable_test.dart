// ignore_for_file: prefer_const_constructors
import 'package:flutter_test/flutter_test.dart';
import 'package:my_garage/src/garage/infra/models/auto.dart';

void main() {
  test('should have same hashCode when values are equal', () {
    final a = Auto(id: 1, brand: 'Toyota', model: 'Mark II JZX91', year: 1994);
    final b = Auto(id: 1, brand: 'Toyota', model: 'Mark II JZX91', year: 1994);
    expect(a == b, true);
    expect(a.hashCode, b.hashCode);
  });
}
