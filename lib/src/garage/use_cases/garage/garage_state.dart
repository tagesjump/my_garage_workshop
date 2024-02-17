part of 'garage_cubit.dart';

abstract class GarageState extends Equatable {
  const GarageState();
}

class GarageInProgress extends GarageState {
  const GarageInProgress();

  @override
  List<Object> get props => [];
}

class GarageSuccess extends GarageState {
  const GarageSuccess(this.autos);

  final List<Auto> autos;

  @override
  List<Object> get props => [autos];
}
