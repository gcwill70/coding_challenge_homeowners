import 'package:flutter/material.dart';

import 'placement.dart';

@immutable
class PlacementOutput {
  final Map<String, List<Placement>> placements;

  const PlacementOutput(this.placements);

  PlacementOutput copyWith({
    Map<String, List<Placement>>? placements,
  }) {
    return PlacementOutput(
      placements ?? this.placements,
    );
  }

  @override
  String toString() {
    List<String> out = [];
    for (var entry in placements.entries) {
      out.add('${entry.key}: ${placements[entry.key]!.join(' ')}');
    }
    return out.join('\n');
  }
}
