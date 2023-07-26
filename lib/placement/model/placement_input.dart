import 'package:flutter/material.dart';
import 'package:pearl/placement/placement.dart';

@immutable
class PlacementInput {
  final List<HomeownerModel> homeowners;
  final List<NeighborhoodModel> neighborhoods;

  const PlacementInput(this.homeowners, this.neighborhoods);

  PlacementInput copyWith({
    List<HomeownerModel>? homeowners,
    List<NeighborhoodModel>? neighborhoods,
  }) {
    return PlacementInput(
      homeowners ?? this.homeowners,
      neighborhoods ?? this.neighborhoods,
    );
  }
}
