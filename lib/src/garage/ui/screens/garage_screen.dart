import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_garage/src/garage/ui/garage/garage_view.dart';
import 'package:my_garage/src/garage/use_cases/garage/garage_cubit.dart';
import 'package:my_garage/src/injection.dart';
import 'package:my_garage/src/router.dart';

class GarageScreen extends StatelessWidget {
  const GarageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<GarageCubit>(),
      child: BlocBuilder<GarageCubit, GarageState>(
        builder: _builder,
      ),
    );
  }

  Widget _builder(BuildContext context, GarageState state) {
    return GarageView(
      autos: state is GarageSuccess ? state.autos : null,
      onAuto: (id) => context.pushNamed(
        RouteName.garageAuto.name,
        pathParameters: {'id': id.toString()},
      ),
      onAddAuto: () => context.pushNamed(RouteName.garageAdd.name),
      onEasterEgg: () => context.pushNamed(RouteName.easterEgg.name),
    );
  }
}
