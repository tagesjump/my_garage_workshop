import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart' show BuildContext;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_garage/src/garage/infra/models/auto.dart';
import 'package:my_garage/src/internal/infra/repositories/garage_repository.dart';

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
      emit(GarageAutoInitial(auto));
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
      if (isClosed) return;
      emit(const GarageAutoSuccess());
    } catch (e) {
      if (isClosed) return;
      emit(GarageAutoNonFatalFailure(e));
      emit(state);
    }
  }

  void updated(int? mileage) async {
    final state = this.state;
    if (mileage == null || state is! GarageAutoInitial) return;

    try {
      emit(const GarageAutoInProgress());
      await _repository.updateAutoById(state.auto.id, mileage: mileage);
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
