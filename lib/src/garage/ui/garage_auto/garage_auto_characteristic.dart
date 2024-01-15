import 'package:my_garage/src/internal/infra/extensions/build_context_x.dart';
import 'package:flutter/material.dart';

class GarageAutoCharacteristic extends StatelessWidget {
  const GarageAutoCharacteristic({
    super.key,
    required this.name,
    required this.value,
    this.nameStyle,
    this.valueStyle,
  });

  final String name;
  final String? value;
  final TextStyle? nameStyle;
  final TextStyle? valueStyle;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: context.t.garageAutoConcatSymbol(name),
        style: nameStyle ??
            context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
        children: [
          const WidgetSpan(child: SizedBox(width: 4.0)),
          TextSpan(
            text: value ?? context.t.garageAutoAbsentLabel,
            style: valueStyle ??
                context.textTheme.bodyMedium
                    ?.copyWith(color: context.colors.secondary),
          )
        ],
      ),
    );
  }
}
