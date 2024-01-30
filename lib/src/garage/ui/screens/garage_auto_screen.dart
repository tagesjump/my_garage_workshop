import 'package:flutter/material.dart';
import 'package:my_garage/src/garage/infra/models/auto.dart';
import 'package:my_garage/src/garage/ui/garage_auto/garage_auto_view.dart';
import 'package:my_garage/src/injection.dart';
import 'package:my_garage/src/router.dart';

class GarageAutoScreen extends StatelessWidget {
  const GarageAutoScreen({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    final auto = getIt<List<Auto>>().firstWhere((a) => a.id == id);
    return GarageAutoView(
      auto: auto,
      onDelete: () {},
      onUpdate: () => context.pushNamed<int?>(
        RouteName.garageUpdate.name,
        pathParameters: {'id': id.toString()},
        queryParameters: <String, String?>{
          'mileage': auto.mileage?.toString(),
        },
      ),
    );
  }
}
