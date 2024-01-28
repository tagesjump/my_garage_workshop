import 'package:flutter/material.dart';
import 'package:my_garage/src/garage/ui/garage_add/garage_add_view.dart';

class GarageAddScreen extends StatelessWidget {
  const GarageAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GarageAddView(
      onBrandChanged: null,
      onModelChanged: null,
      onYearChanged: null,
      onAdded: () {},
    );
  }
}
