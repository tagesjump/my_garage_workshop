import 'package:flutter/material.dart';
import 'package:my_garage/src/garage/infra/models/auto.dart';
import 'package:my_garage/src/garage/ui/garage/garage_view.dart';
import 'package:my_garage/src/injection.dart';
import 'package:my_garage/src/router.dart';

class GarageScreen extends StatelessWidget {
  const GarageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GarageView(
      autos: getIt<List<Auto>>(),
      onAuto: (id) => context.pushNamed(
        RouteName.garageAuto.name,
        pathParameters: {'id': id.toString()},
      ),
      onAddAuto: () => context.pushNamed(RouteName.garageAdd.name),
      onEasterEgg: () => context.pushNamed(RouteName.easterEgg.name),
    );
  }
}
