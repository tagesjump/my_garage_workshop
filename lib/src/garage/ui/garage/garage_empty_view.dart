import 'package:flutter/material.dart';
import 'package:my_garage/src/internal/infra/extensions/build_context_x.dart';

class GarageEmptyView extends StatelessWidget {
  const GarageEmptyView({
    super.key,
    required this.padding,
    required this.child,
  });

  final EdgeInsets padding;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: DefaultTextStyle.merge(
        textAlign: TextAlign.center,
        style: context.textTheme.bodyMedium
            ?.copyWith(color: context.colors.secondary),
        child: child,
      ),
    );
  }
}
