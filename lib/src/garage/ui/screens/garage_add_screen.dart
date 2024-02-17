import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_garage/src/garage/ui/garage_add/garage_add_view.dart';
import 'package:my_garage/src/garage/use_cases/garage_add/garage_add_cubit.dart';
import 'package:my_garage/src/injection.dart';
import 'package:my_garage/src/internal/infra/extensions/build_context_x.dart';
import 'package:my_garage/src/router.dart';

class GarageAddScreen extends StatelessWidget {
  const GarageAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<GarageAddCubit>(),
      child: BlocConsumer<GarageAddCubit, GarageAddState>(
        builder: _builder,
        listener: _listener,
      ),
    );
  }

  void _listener(BuildContext context, GarageAddState state) {
    if (state is GarageAddFailure) {
      context.showSnackBar(state.error.toString());
    } else if (state is GarageAddSuccess) {
      context.pop();
    }
  }

  Widget _builder(BuildContext context, GarageAddState state) {
    return GarageAddView(
      onBrandChanged: (brand) => context.garageAdd.changed(brand: brand),
      onModelChanged: (model) => context.garageAdd.changed(model: model),
      onYearChanged: (year) =>
          context.garageAdd.changed(year: int.tryParse(year)),
      onAdded:
          state is GarageAddInProgress ? null : context.garageAdd.submitted,
    );
  }
}
