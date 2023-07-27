// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pearl/placement/placement.dart';
import 'package:pearl/placement/repo/placement_repo.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final PlacementRepo repo = PlacementRepo();
  group('PlacementBloc', () {
    final List<HomeownerModel> homeowners = [
      HomeownerModel(3, 9, 2, 'H0', ['N2', 'N0', 'N1']),
      HomeownerModel(4, 3, 7, 'H1', ['N0', 'N2', 'N1']),
      HomeownerModel(4, 0, 10, 'H2', ['N0', 'N2', 'N1']),
      HomeownerModel(10, 3, 8, 'H3', ['N2', 'N0', 'N1']),
      HomeownerModel(6, 10, 1, 'H4', ['N0', 'N2', 'N1']),
      HomeownerModel(6, 7, 7, 'H5', ['N0', 'N2', 'N1']),
      HomeownerModel(8, 6, 9, 'H6', ['N2', 'N1', 'N0']),
      HomeownerModel(7, 1, 5, 'H7', ['N2', 'N1', 'N0']),
      HomeownerModel(8, 2, 3, 'H8', ['N1', 'N0', 'N2']),
      HomeownerModel(10, 2, 1, 'H9', ['N1', 'N2', 'N0']),
      HomeownerModel(6, 4, 5, 'H10', ['N0', 'N2', 'N1']),
      HomeownerModel(8, 4, 7, 'H11', ['N0', 'N1', 'N2']),
    ];
    final List<NeighborhoodModel> neighborhoods = [
      NeighborhoodModel(7, 7, 10, 'N0'),
      NeighborhoodModel(2, 1, 1, 'N1'),
      NeighborhoodModel(7, 6, 4, 'N2'),
    ];
    final Map<String, List<Placement>> placements = {
      'N0': [
        Placement('H5', 161),
        Placement('H11', 154),
        Placement('H2', 128),
        Placement('H4', 122),
      ],
      'N1': [
        Placement('H9', 23),
        Placement('H8', 21),
        Placement('H7', 20),
        Placement('H1', 18),
      ],
      'N2': [
        Placement('H6', 128),
        Placement('H3', 120),
        Placement('H10', 86),
        Placement('H0', 83),
      ],
    };
    test('loadInput() test', () async {
      final input = await rootBundle.loadString('files/input1.txt');
      final actual = await repo.loadInput(input);
      assert(listEquals(actual.homeowners, homeowners));
      assert(listEquals(actual.neighborhoods, neighborhoods));
    });

    test('place() test', () async {
      final actual =
          await repo.place(PlacementInput(homeowners, neighborhoods));
      for (var key in actual.placements.keys) {
        // check length
        assert(actual.placements[key]!.length ==
            homeowners.length ~/ neighborhoods.length);
      }
    });
  });
}
