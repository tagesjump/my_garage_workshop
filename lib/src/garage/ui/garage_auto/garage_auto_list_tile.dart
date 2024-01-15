import 'package:my_garage/src/garage/infra/models/auto.dart';
import 'package:my_garage/src/garage/ui/garage_auto/garage_auto_characteristic.dart';
import 'package:my_garage/src/internal/infra/extensions/build_context_x.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

abstract class GarageAutoListTile extends StatelessWidget {
  const GarageAutoListTile({super.key});

  factory GarageAutoListTile.short({
    Key? key,
    required Auto auto,
    required VoidCallback? onTap,
  }) {
    return GarageAutoShortListTile(key: key, auto: auto, onTap: onTap);
  }

  factory GarageAutoListTile.detail({
    Key? key,
    required Widget title,
    required Widget subtitle,
    required List<GarageAutoCharacteristic> characteristics,
    required VoidCallback? onUpdate,
  }) {
    return GarageAutoDetailListTile(
      key: key,
      title: title,
      subtitle: subtitle,
      characteristics: characteristics,
      onUpdate: onUpdate,
    );
  }
}

class GarageAutoShortListTile extends StatelessWidget
    implements GarageAutoListTile {
  const GarageAutoShortListTile({
    super.key,
    required this.auto,
    required this.onTap,
  });

  final Auto auto;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final auto = this.auto;
    return ListTile(
      leading: const CircleAvatar(
        child: Icon(Icons.directions_car_outlined),
      ),
      title: Text(context.t.garageAutoName(auto.name, auto.year)),
      subtitle: GarageAutoCharacteristic(
        name: context.t.garageAutoMileageLabel,
        value: auto.mileage != null
            ? context.t.garageAutoMileage(
                NumberFormat.decimalPattern().format(auto.mileage),
              )
            : null,
        nameStyle: context.textTheme.bodyMedium,
        valueStyle: context.textTheme.bodyMedium
            ?.copyWith(color: context.colors.secondary),
      ),
      onTap: onTap,
    );
  }
}

class GarageAutoDetailListTile extends StatelessWidget
    implements GarageAutoListTile {
  const GarageAutoDetailListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.characteristics,
    required this.onUpdate,
  });

  final Widget title;
  final Widget subtitle;
  final List<GarageAutoCharacteristic> characteristics;
  final VoidCallback? onUpdate;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0).copyWith(bottom: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CircleAvatar(
                  child: Icon(Icons.directions_car_outlined),
                ),
                const SizedBox(width: 16.0),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultTextStyle.merge(
                        style: context.textTheme.titleMedium,
                        child: title,
                      ),
                      DefaultTextStyle.merge(
                        style: context.textTheme.bodyMedium
                            ?.copyWith(color: context.colors.secondary),
                        child: subtitle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              shrinkWrap: true,
              itemBuilder: (_, index) => characteristics[index],
              separatorBuilder: (_, __) => const SizedBox(height: 4.0),
              itemCount: characteristics.length,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FilledButton.tonal(
                  style: TextButton.styleFrom(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: VisualDensity.comfortable,
                    padding: const EdgeInsets.symmetric(
                      vertical: 4.0,
                      horizontal: 8.0,
                    ),
                  ),
                  onPressed: onUpdate,
                  child: Text(context.t.garageAutoUpdateButton),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
