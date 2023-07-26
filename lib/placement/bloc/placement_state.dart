part of 'placement_bloc.dart';

abstract class PlacementState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PlacementInitial extends PlacementState {}

class PlacementLoadingInput extends PlacementState {}

class PlacementLoadedInput extends PlacementState {
  final PlacementInput input;

  PlacementLoadedInput(this.input);

  @override
  List<Object?> get props => [input];
}

class PlacementLoadInputError extends PlacementState {}
