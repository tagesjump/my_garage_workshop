import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_garage/src/garage/ui/garage_auto/garage_auto_error_view.dart';
import 'package:my_garage/src/garage/ui/garage_auto/garage_auto_view.dart';
import 'package:my_garage/src/garage/use_cases/garage_auto/garage_auto_cubit.dart';
import 'package:my_garage/src/injection.dart';
import 'package:my_garage/src/internal/infra/extensions/build_context_x.dart';
import 'package:my_garage/src/router.dart';

class GarageAutoScreen extends StatelessWidget {
  const GarageAutoScreen({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<GarageAutoCubit>()..started(id),
      child: BlocConsumer<GarageAutoCubit, GarageAutoState>(
        builder: _builder,
        buildWhen: (previous, current) =>
            current is GarageAutoInProgress ||
            current is GarageAutoInitial ||
            current is GarageAutoFailure,
        listener: _listener,
      ),
    );
  }

  void _listener(BuildContext context, GarageAutoState state) {
    if (state is GarageAutoNonFatalFailure) {
      context.showSnackBar(state.error.toString());
    } else if (state is GarageAutoSuccess) {
      context.pop();
    }
  }

  Widget _builder(BuildContext context, GarageAutoState state) {
    if (state is GarageAutoInitial) {
      return GarageAutoView(
        auto: state.auto,
        onDelete: context.garageAuto.deleted,
        onUpdate: () async {
          final mileage = await context.pushNamed<int?>(
            RouteName.garageUpdate.name,
            pathParameters: {'id': state.auto.id.toString()},
            queryParameters: <String, String?>{
              'mileage': state.auto.mileage?.toString(),
            },
          );
          if (!context.mounted) return;
          return context.garageAuto.updated(mileage);
        },
      );
    } else if (state is GarageAutoFailure) {
      return GarageAutoErrorView(
        child: Text(state.error.toString()),
        onRetry: () => context.garageAuto.started(id),
      );
    }
    return const GarageAutoView(auto: null, onDelete: null, onUpdate: null);
  }
}
