// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pearl/placement/placement.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('PlacementBloc', () {
    final List<HomeownerModel> expHomeowners = [
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
    final List<NeighborhoodModel> expNeighborhoods = [
      NeighborhoodModel(7, 7, 10, 'N0'),
      NeighborhoodModel(2, 1, 1, 'N1'),
      NeighborhoodModel(7, 6, 4, 'N2'),
    ];
    test('load input test', () async {
      final input = await rootBundle.loadString('files/input1.txt');
      final actual = await PlacementBloc().loadInput(input);
      assert(listEquals(actual.homeowners, expHomeowners));
      assert(listEquals(actual.neighborhoods, expNeighborhoods));
    });
  });
}
