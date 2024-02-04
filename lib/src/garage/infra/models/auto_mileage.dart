import 'package:equatable/equatable.dart';

class AutoMileage extends Equatable {
  const AutoMileage({
    required this.id,
    required this.autoId,
    required this.value,
    required this.createdAt,
  });

  final int id;
  final int autoId;
  final int value;
  final DateTime createdAt;

  @override
  List<Object> get props => [id, autoId, value, createdAt];
}
