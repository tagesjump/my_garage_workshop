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

  final int id;
  final String brand;
  final String model;
  final int year;
  final String? bodyNumber;
  final String? chassisNumber;
  final String? vin;
  final int? mileage;

  String get name => [brand, model].join(' ');

  @override
  List<Object?> get props =>
      [id, brand, model, year, bodyNumber, chassisNumber, vin, mileage];
}
