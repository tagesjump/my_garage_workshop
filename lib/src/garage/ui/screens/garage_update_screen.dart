import 'package:flutter/material.dart';
import 'package:my_garage/src/garage/ui/garage_update/garage_update_view.dart';

class GarageUpdateScreen extends StatelessWidget {
  const GarageUpdateScreen({super.key, required this.mileage});

  final int? mileage;

  @override
  Widget build(BuildContext context) {
    return GarageUpdateView(mileage: mileage);
  }
}
