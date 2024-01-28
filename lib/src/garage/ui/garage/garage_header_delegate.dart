import 'package:flutter/material.dart';
import 'package:my_garage/src/internal/infra/extensions/build_context_x.dart';

class GarageHeaderDelegate extends SliverPersistentHeaderDelegate {
  const GarageHeaderDelegate({
    this.backgroundColor,
    this.loading,
    required this.padding,
    required this.child,
  });

  final Color? backgroundColor;
  final bool? loading;
  final EdgeInsets padding;
  final Widget child;

  @override
  Widget build(context, shrinkOffset, overlapsContent) {
    final loading = this.loading;
    return ColoredBox(
      color: backgroundColor ?? context.colors.background,
      child: Padding(
        padding: padding,
        child: Align(
          alignment: Alignment.centerLeft,
          child: DefaultTextStyle.merge(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(child: child),
                if (loading != null && loading) ...{
                  const SizedBox(width: 8.0),
                  const SizedBox.square(
                    dimension: 12.0,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.0,
                    ),
                  ),
                }
              ],
            ),
            style: context.textTheme.titleMedium,
          ),
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
