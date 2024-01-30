import 'package:flutter/material.dart';
import 'package:my_garage/src/garage/ui/garage_update/garage_update_screen.dart';

class GarageUpdateScreen extends StatelessWidget {
  const GarageUpdateScreen({super.key, required int? mileage})
      : mileage = mileage ?? 0;

  final int mileage;

  @override
  Widget build(BuildContext context) {
    return GarageUpdateView(mileage: mileage);
  }
}
