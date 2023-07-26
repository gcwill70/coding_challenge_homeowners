// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pearl/placement/placement.dart';

void main() {
  group('PlacementBloc', () {
    // H H0 E:3 W:9 R:2 N2>N0>N1
    // H H1 E:4 W:3 R:7 N0>N2>N1
    // H H2 E:4 W:0 R:10 N0>N2>N1
    // H H3 E:10 W:3 R:8 N2>N0>N1
    // H H4 E:6 W:10 R:1 N0>N2>N1
    // H H5 E:6 W:7 R:7 N0>N2>N1
    // H H6 E:8 W:6 R:9 N2>N1>N0
    // H H7 E:7 W:1 R:5 N2>N1>N0
    // H H8 E:8 W:2 R:3 N1>N0>N2
    // H H9 E:10 W:2 R:1 N1>N2>N0
    // H H10 E:6 W:4 R:5 N0>N2>N1
    // H H11 E:8 W:4 R:7 N0>N1>N2
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
    // N N0 E:7 W:7 R:10
    // N N1 E:2 W:1 R:1
    // N N2 E:7 W:6 R:4
    final List<NeighborhoodModel> expNeighborhoods = [
      NeighborhoodModel(7, 7, 10, 'N0'),
      NeighborhoodModel(2, 1, 1, 'N1'),
      NeighborhoodModel(7, 6, 4, 'N2'),
    ];
    test('load input test', () async {
      final bloc = PlacementBloc();
      final actual = await bloc.loadInput('''N N0 E:7 W:7 R:10
N N1 E:2 W:1 R:1
N N2 E:7 W:6 R:4
H H0 E:3 W:9 R:2 N2>N0>N1
H H1 E:4 W:3 R:7 N0>N2>N1
H H2 E:4 W:0 R:10 N0>N2>N1
H H3 E:10 W:3 R:8 N2>N0>N1
H H4 E:6 W:10 R:1 N0>N2>N1
H H5 E:6 W:7 R:7 N0>N2>N1
H H6 E:8 W:6 R:9 N2>N1>N0
H H7 E:7 W:1 R:5 N2>N1>N0
H H8 E:8 W:2 R:3 N1>N0>N2
H H9 E:10 W:2 R:1 N1>N2>N0
H H10 E:6 W:4 R:5 N0>N2>N1
H H11 E:8 W:4 R:7 N0>N1>N2''');
      assert(listEquals(actual.homeowners, expHomeowners));
      assert(listEquals(actual.neighborhoods, expNeighborhoods));
    });
  });
}
