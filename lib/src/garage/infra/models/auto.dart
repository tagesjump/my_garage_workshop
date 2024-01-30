import 'package:equatable/equatable.dart';

class Auto extends Equatable {
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
}
