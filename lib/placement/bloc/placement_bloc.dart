import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pearl/placement/placement.dart';
import 'package:pearl/placement/repo/placement_repo.dart';

part 'placement_event.dart';
part 'placement_state.dart';

class PlacementBloc extends Bloc<PlacementEvent, PlacementState> {
  final PlacementRepo _repo;

  PlacementBloc(this._repo) : super(PlacementInitial()) {
    on<PlacementLoadInput>((event, emit) async {
      try {
        emit(PlacementLoadingInput());
        // await Future.delayed(const Duration(seconds: 5));
        final input = await _repo.loadInput(event.input);
        emit(PlacementLoadedInput(input));
        // await Future.delayed(const Duration(seconds: 2));
        emit(PlacementCalculating());
        // await Future.delayed(const Duration(seconds: 5));
        final output = await _repo.place(input);
        emit(PlacementComplete(output));
      } catch (e) {
        emit(PlacementError());
      }
    });
  }
}
