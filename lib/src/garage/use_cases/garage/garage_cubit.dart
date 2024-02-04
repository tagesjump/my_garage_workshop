import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart' show BuildContext;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_garage/src/garage/infra/models/auto.dart';
import 'package:my_garage/src/internal/infra/repositories/garage_repository.dart';

part 'garage_state.dart';

@injectable
class GarageCubit extends Cubit<GarageState> {
  GarageCubit(this._repository) : super(const GarageInProgress()) {
    _sub = _repository.watchAutoList().listen(_listener);
  }

  final GarageRepository _repository;
  late final StreamSubscription<List<Auto>> _sub;

  @override
  Future<void> close() {
    _sub.cancel();
    return super.close();
  }

  void _listener(List<Auto> autos) {
    if (isClosed) return;
    emit(GarageSuccess(autos));
  }
}

extension GarageCubitX on BuildContext {
  GarageCubit get garage => read<GarageCubit>();
}
