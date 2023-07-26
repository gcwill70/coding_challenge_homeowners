import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pearl/placement/model/placement_input.dart';

part 'placement_event.dart';
part 'placement_state.dart';

class PlacementBloc extends Bloc<PlacementEvent, PlacementState> {
  PlacementBloc() : super(PlacementInitial()) {
    on<PlacementLoadInput>((event, emit) async {
      try {
        emit(PlacementLoadingInput());
        final results = await _loadInput(event.input);
        emit(PlacementLoadedInput(results));
      } catch (e) {
        emit(PlacementLoadInputError());
      }
    });
  }

  Future<PlacementInput> _loadInput(String input) async {
    return const PlacementInput([], []);
  }
}
