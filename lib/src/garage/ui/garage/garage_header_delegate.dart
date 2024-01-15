import 'package:my_garage/src/internal/infra/extensions/build_context_x.dart';
import 'package:flutter/material.dart';

class GarageHeaderDelegate extends SliverPersistentHeaderDelegate {
  const GarageHeaderDelegate(
    this.title, {
    this.backgroundColor,
    required this.padding,
  });

  final String title;
  final Color? backgroundColor;
  final EdgeInsets padding;

  @override
  Widget build(context, shrinkOffset, overlapsContent) {
    return ColoredBox(
      color: backgroundColor ?? context.colors.background,
      child: Padding(
        padding: padding,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(title, style: context.textTheme.titleMedium),
        ),
      ),
    );
  }

  @override
  double get maxExtent => minExtent;

  @override
  double get minExtent => 44.0;

  @override
  bool shouldRebuild(oldDelegate) => false;
}
