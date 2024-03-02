part of 'garage_auto_cubit.dart';

abstract class GarageAutoState extends Equatable {
  const GarageAutoState();
}

class GarageAutoInProgress extends GarageAutoState {
  const GarageAutoInProgress();

  @override
  List<Object> get props => [];
}

class GarageAutoInitial extends GarageAutoState {
  const GarageAutoInitial(this.auto, this.mileageHistory );

  final Auto auto;
  final List<AutoMileage> mileageHistory;

  @override
  List<Object> get props => [auto, mileageHistory];
}

class GarageAutoFailure extends GarageAutoState {
  const GarageAutoFailure(this.error);

  final Object error;

  @override
  List<Object> get props => [error];
}

class GarageAutoNonFatalFailure extends GarageAutoState {
  const GarageAutoNonFatalFailure(this.error);

  final Object error;

  @override
  List<Object> get props => [error];
}

class GarageAutoSuccess extends GarageAutoState {
  const GarageAutoSuccess();

  @override
  List<Object> get props => [];
}
