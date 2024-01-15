part of 'router.dart';

enum RouteName {
  garage('/garage'),
  garageAdd('add'),
  garageAuto('auto/:id');

  const RouteName(this.path);

  final String path;

  String get name =>
      toString().substring(toString().indexOf('.') + 1).toSnakeCase;
}
