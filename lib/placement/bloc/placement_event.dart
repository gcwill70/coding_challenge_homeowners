part of 'placement_bloc.dart';

abstract class PlacementEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class PlacementLoadInput extends PlacementEvent {
  final String input;

  PlacementLoadInput(this.input);

  @override
  List<Object?> get props => [input];
}
