import '../model/homeowner_model.dart';
import '../model/neighborhood_model.dart';
import '../model/placement.dart';
import '../model/placement_input.dart';
import '../model/placement_output.dart';

class PlacementRepo {
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
    int maximum = input.homeowners.length ~/ input.neighborhoods.length;
    // calculate score matrix
    Map<String, Map<String, int>> matrix = {};
    for (var homeowner in input.homeowners) {
      matrix[homeowner.name] = {};
      for (var neighborhood in input.neighborhoods) {
        int score = 0;
        score += homeowner.energy * neighborhood.energy;
        score += homeowner.water * neighborhood.water;
        score += homeowner.resilience * neighborhood.resilience;
        score *= (maximum - homeowner.preferences.indexOf(neighborhood.name));
        matrix[homeowner.name]![neighborhood.name] = score;
      }
    }
    // for each neighborhood, select top choices and move on
    for (var neighborhood in input.neighborhoods) {
      // create placement list for neighborhood
      placements[neighborhood.name] = [];
      // get top scores for neighborhood
      var topScores = matrix
          .map((key, value) => MapEntry(key, value[neighborhood.name]))
          .values
          .toList()
        ..sort((a, b) => b!.compareTo(a!));
      // assign homeowners with top scores
      for (var topScore in topScores.sublist(0, maximum)) {
        var name = matrix.entries
            .firstWhere((entry) => entry.value[neighborhood.name] == topScore)
            .key;
        var homeowner = input.homeowners.firstWhere((h) => h.name == name);
        placements[neighborhood.name] ??= [];
        placements[neighborhood.name]!
            .add(Placement.place(homeowner, neighborhood));
        // remove homeowner from eligibility
        matrix.remove(homeowner.name);
      }
    }
    return Future.value(PlacementOutput(placements));
  }
}
