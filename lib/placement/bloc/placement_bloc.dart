import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pearl/placement/placement.dart';

part 'placement_event.dart';
part 'placement_state.dart';

class PlacementBloc extends Bloc<PlacementEvent, PlacementState> {
  PlacementBloc() : super(PlacementInitial()) {
    on<PlacementLoadInput>((event, emit) async {
      try {
        emit(PlacementLoadingInput());
        final input = await _loadInput(event.input);
        emit(PlacementLoadedInput(input));
        final output = await _place(input);
        emit(PlacementComplete(output));
      } catch (e) {
        emit(PlacementError());
      }
    });
  }

  Future<PlacementInput> _loadInput(String input) async {
    return const PlacementInput([], []);
  }

  Future<PlacementOutput> _place(PlacementInput input) {
    return Future.value(const PlacementOutput({}));
  }
}
