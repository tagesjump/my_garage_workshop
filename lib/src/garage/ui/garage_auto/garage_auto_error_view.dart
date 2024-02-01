import 'package:flutter/material.dart';
import 'package:my_garage/src/internal/infra/extensions/build_context_x.dart';

class GarageAutoErrorView extends StatelessWidget {
  const GarageAutoErrorView({
    super.key,
    required this.child,
    required this.onRetry,
  });

  final Widget child;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.t.garageAutoAppBarTitle),
        surfaceTintColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  context.t.garageAutoErrorTitle,
                  style: context.textTheme.titleMedium,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const SizedBox(height: 4.0),
                Flexible(
                  child: DefaultTextStyle.merge(
                    style: context.textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    child: child,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FractionallySizedBox(
        widthFactor: 1.0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FilledButton(
            onPressed: onRetry,
            child: Text(context.t.garageAutoErrorRetryButton),
          ),
        ),
      ),
    );
  }
}
