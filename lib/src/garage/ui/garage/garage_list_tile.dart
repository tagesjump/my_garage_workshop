import 'package:my_garage/src/internal/infra/extensions/build_context_x.dart';
import 'package:flutter/material.dart';

class GarageListTile extends StatelessWidget {
  const GarageListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onAddAuto,
  });

  final Widget title;
  final Widget subtitle;
  final VoidCallback? onAddAuto;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0).copyWith(bottom: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            DefaultTextStyle.merge(
              style: context.textTheme.titleMedium,
              child: title,
            ),
            const SizedBox(height: 4.0),
            DefaultTextStyle.merge(
              style: context.textTheme.bodyMedium,
              child: subtitle,
            ),
            const SizedBox(height: 8.0),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                FilledButton(
                  style: TextButton.styleFrom(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: VisualDensity.comfortable,
                    padding: const EdgeInsets.symmetric(
                      vertical: 4.0,
                      horizontal: 8.0,
                    ),
                  ),
                  onPressed: onAddAuto,
                  child: Text(context.t.garageAddAuto),
                )
              ],
            ),
            const SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
