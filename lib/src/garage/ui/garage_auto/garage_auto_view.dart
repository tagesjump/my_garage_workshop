import 'package:my_garage/src/garage/infra/models/auto.dart';
import 'package:my_garage/src/garage/ui/garage_auto/garage_auto_characteristic.dart';
import 'package:my_garage/src/garage/ui/garage_auto/garage_auto_list_tile.dart';
import 'package:my_garage/src/internal/infra/extensions/build_context_x.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GarageAutoView extends StatelessWidget {
  const GarageAutoView({
    super.key,
    required this.auto,
    required this.onDelete,
    required this.onUpdate,
  });

  final Auto auto;
  final VoidCallback? onDelete;
  final VoidCallback? onUpdate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.t.garageAutoAppBarTitle),
        actions: [
          IconButton(
            onPressed: onDelete,
            icon: const Icon(Icons.delete_outline),
          ),
          const SizedBox(width: 8.0),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        children: [
          GarageAutoListTile.detail(
            title: Text(context.t.garageAutoAboutTitle),
            subtitle: Text(context.t.garageAutoName(auto.name, auto.year)),
            characteristics: [
              GarageAutoCharacteristic(
                name: context.t.garageAutoMileageLabel,
                value: auto.mileage != null
                    ? context.t.garageAutoMileage(
                        NumberFormat.decimalPattern().format(auto.mileage),
                      )
                    : null,
              ),
              GarageAutoCharacteristic(
                name: context.t.garageAutoBodyNumberLabel,
                value: auto.bodyNumber,
              ),
              GarageAutoCharacteristic(
                name: context.t.garageAutoChassisNumberLabel,
                value: auto.chassisNumber,
              ),
              GarageAutoCharacteristic(
                name: context.t.garageAutoVinLabel,
                value: auto.vin,
              ),
            ],
            onUpdate: onUpdate,
          ),
        ],
      ),
    );
  }
}
