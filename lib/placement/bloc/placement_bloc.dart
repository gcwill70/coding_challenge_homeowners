import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pearl/placement/model/placement.dart';
import 'package:pearl/placement/placement.dart';

part 'placement_event.dart';
part 'placement_state.dart';

class PlacementBloc extends Bloc<PlacementEvent, PlacementState> {
  PlacementBloc() : super(PlacementInitial()) {
    on<PlacementLoadInput>((event, emit) async {
      try {
        emit(PlacementLoadingInput());
        final input = await loadInput(event.input);
        emit(PlacementLoadedInput(input));
        final output = await place(input);
        emit(PlacementComplete(output));
      } catch (e) {
        emit(PlacementError());
      }
    });
  }

  Future<PlacementInput> loadInput(String input) async {
    List<HomeownerModel> homeowners = [];
    List<NeighborhoodModel> neighborhoods = [];
    for (String line in input.split('\n')) {
      if (line.startsWith('N')) {
        neighborhoods.add(NeighborhoodModel.fromString(line));
      } else if (line.startsWith('H')) {
        homeowners.add(HomeownerModel.fromString(line));
      }
    }
    return PlacementInput(homeowners, neighborhoods);
  }

  Future<PlacementOutput> place(PlacementInput input) {
    Map<String, List<Placement>> placements = {};
    // add neighborhoods
    for (String name in input.neighborhoods.map((e) => e.name)) {
      placements[name] = [];
    }
    //
    return Future.value(PlacementOutput(placements));
  }
}
