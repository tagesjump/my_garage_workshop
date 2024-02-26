import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_garage/src/garage/infra/models/auto.dart';
import 'package:my_garage/src/internal/infra/repositories/garage_repository.dart';

part 'garage_add_state.dart';

@injectable
class GarageAddCubit extends Cubit<GarageAddState> {
  GarageAddCubit(this._repository) : super(GarageAddInitial(Auto.empty()));

  final GarageRepository _repository;

  void changed({String? brand, String? model, int? year}) {
    final state = this.state;
    if (state is! GarageAddInitial) return;

    final auto = state.auto.copyWith(brand: brand, model: model, year: year);
    emit(GarageAddInitial(auto));
  }

  void submitted() async {
    final state = this.state;
    if (state is! GarageAddInitial) return;

    try {
      emit(const GarageAddInProgress());
      await _repository.insertAuto(state.auto);
      if (isClosed) return;
      emit(const GarageAddSuccess());
    } catch (e) {
      emit(GarageAddFailure(e));
      emit(state);
    }
  }
}

extension GarageAddCubitX on BuildContext {
  GarageAddCubit get garageAdd => read<GarageAddCubit>();
}
