import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:my_garage/src/internal/infra/database.dart';

class Auto extends Equatable implements Insertable<Auto> {
  const Auto({
    required this.id,
    required this.brand,
    required this.model,
    required this.year,
    this.bodyNumber,
    this.chassisNumber,
    this.vin,
    this.mileage,
  });

  factory Auto.empty() => const Auto(id: 0, brand: '', model: '', year: 0);

  final int id;
  final String brand;
  final String model;
  final int year;
  final String? bodyNumber;
  final String? chassisNumber;
  final String? vin;
  final int? mileage;

  String get name => [brand, model].join(' ');

  Auto copyWith({String? brand, String? model, int? year}) {
    return Auto(
      id: id,
      brand: brand ?? this.brand,
      model: model ?? this.model,
      year: year ?? this.year,
      bodyNumber: bodyNumber,
      chassisNumber: chassisNumber,
      vin: vin,
      mileage: mileage,
    );
  }

  @override
  List<Object?> get props =>
      [id, brand, model, year, bodyNumber, chassisNumber, vin, mileage];

  @override
  Map<String, Expression<Object>> toColumns(bool nullToAbsent) {
    return AutoTableCompanion.insert(
      brand: brand,
      model: model,
      year: year,
      bodyNumber: Value(bodyNumber),
      chassisNumber: Value(chassisNumber),
      vin: Value(vin),
      mileage: Value(mileage),
    ).toColumns(nullToAbsent);
  }
}
