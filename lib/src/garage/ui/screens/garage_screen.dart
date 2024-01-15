import 'package:my_garage/src/garage/infra/models/auto.dart';
import 'package:my_garage/src/garage/ui/garage/garage_view.dart';
import 'package:my_garage/src/router.dart';
import 'package:flutter/material.dart';

class GarageScreen extends StatelessWidget {
  const GarageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const autos = [
      Auto(
        id: 1,
        brand: 'Toyota',
        model: 'Mark II JZX91',
        year: 1994,
        mileage: 294777,
      ),
      Auto(
        id: 2,
        brand: 'Suzuki',
        model: 'Jimny JB23W',
        year: 2015,
        mileage: 139044,
      ),
    ];
    return GarageView(
      autos: autos,
      onAuto: (id) => context.pushNamed(
        RouteName.garageAuto.name,
        pathParameters: {'id': id.toString()},
        extra: autos.firstWhere((a) => a.id == id),
      ),
      onAddAuto: () => context.pushNamed(RouteName.garageAdd.name),
    );
  }
}
