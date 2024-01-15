import 'package:my_garage/src/garage/infra/models/auto.dart';
import 'package:my_garage/src/garage/ui/garage_auto/garage_auto_view.dart';
import 'package:flutter/material.dart';

class GarageAutoScreen extends StatelessWidget {
  const GarageAutoScreen({
    super.key,
    required this.auto,
  });

  final Auto auto;

  @override
  Widget build(BuildContext context) {
    return GarageAutoView(
      auto: auto,
      onDelete: () {},
      onUpdate: () {},
    );
  }
}
