import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:my_garage/src/internal/infra/database.dart';

class AutoMileage extends Equatable implements Insertable<AutoMileage> {
  const AutoMileage({
    required this.id,
    required this.autoId,
    required this.value,
    required this.createdAt,
  });

  factory AutoMileage.empty() =>  AutoMileage(
      id: 0, autoId: 0, value: 0, createdAt: DateTime.now());

  final int id;
  final int autoId;
  final int value;
  final DateTime createdAt;

  AutoMileage copyWith({
    int? autoId,
    int? value,
  }) {
    return AutoMileage(
      id: id,
      autoId: autoId ?? this.autoId,
      value: value ?? this.value,
      createdAt: createdAt ,
    );
  }

  @override
  List<Object> get props => [id, autoId, value, createdAt];

  @override
  Map<String, Expression<Object>> toColumns(bool nullToAbsent) {
    return AutoMileageTableCompanion.insert(
      autoId: autoId,
      value: value,
      createdAt: createdAt,
    ).toColumns(nullToAbsent);
  }
}
