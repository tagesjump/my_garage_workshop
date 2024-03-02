import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart' show BuildContext;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_garage/src/garage/infra/models/auto.dart';
import 'package:my_garage/src/internal/infra/repositories/garage_repository.dart';
import 'package:my_garage/src/garage/infra/models/auto_mileage.dart';

part 'garage_auto_state.dart';

@injectable
class GarageAutoCubit extends Cubit<GarageAutoState> {
  GarageAutoCubit(this._repository) : super(const GarageAutoInProgress());

  final GarageRepository _repository;

  void started(int id) async {
    try {
      emit(const GarageAutoInProgress());
      final auto = await _repository.getAutoById(id);
      if (isClosed) return;
      if (auto == null) return emit(const GarageAutoSuccess());
      emit(GarageAutoInitial(auto, List.empty()));
      _repository.watchMileagesForAuto(id).listen(
          (mileageHistory) => emit(GarageAutoInitial(auto, mileageHistory)));
    } catch (e) {
      if (isClosed) return;
      emit(GarageAutoFailure(e));
    }
  }

  void deleted() async {
    final state = this.state;
    if (state is! GarageAutoInitial) return;

    try {
      emit(const GarageAutoInProgress());
      await _repository.deleteAutoById(state.auto.id);
      await _repository.deleteMileagesByAutoId(state.auto.id);
      if (isClosed) return;
      emit(const GarageAutoSuccess());
    } catch (e) {
      if (isClosed) return;
      emit(GarageAutoNonFatalFailure(e));
      emit(state);
    }
  }

  // TODO(DanilAbdrafikov): Update body number, chassis number, vin fields (Done)
  void updated({
    required String? bodyNumber,
    required String? chassisNumber,
    required String? vin,
    required int? mileage,
  }) async {
    final state = this.state;
    if (state is! GarageAutoInitial) return;

    try {
      emit(const GarageAutoInProgress());
      await _repository.updateAutoById(
        state.auto.id,
        bodyNumber: bodyNumber,
        chassisNumber: chassisNumber,
        vin: vin,
        mileage: mileage,
      );
      await _repository.insertMileage(
          AutoMileage.empty().copyWith(
            autoId: state.auto.id,
            value: mileage,
          )
      );
      if (isClosed) return;
      return started(state.auto.id);
    } catch (e) {
      if (isClosed) return;
      emit(GarageAutoNonFatalFailure(e));
      emit(state);
    }
  }
}

extension GarageAutoCubitX on BuildContext {
  GarageAutoCubit get garageAuto => read<GarageAutoCubit>();
}
