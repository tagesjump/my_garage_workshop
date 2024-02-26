part of 'garage_add_cubit.dart';

abstract class GarageAddState extends Equatable {
  const GarageAddState();
}

class GarageAddInitial extends GarageAddState {
  const GarageAddInitial(this.auto);

  final Auto auto;

  @override
  List<Object> get props => [auto];
}

class GarageAddInProgress extends GarageAddState {
  const GarageAddInProgress();

  @override
  List<Object> get props => [];
}

class GarageAddFailure extends GarageAddState {
  const GarageAddFailure(this.error);

  final Object error;

  @override
  List<Object> get props => [error];
}

class GarageAddSuccess extends GarageAddState {
  const GarageAddSuccess();

  @override
  List<Object> get props => [];
}
