import 'package:flutter/foundation.dart';
import 'package:pearl/placement/model/vector_model.dart';

@immutable
class NeighborhoodModel extends VectorModel {
  final String name;

  const NeighborhoodModel(
    super.energy,
    super.water,
    super.resilience,
    this.name,
  );

  @override
  NeighborhoodModel copyWith({
    int? energy,
    int? water,
    int? resilience,
    String? name,
    List<String>? preferences,
  }) {
    return NeighborhoodModel(
      energy ?? this.energy,
      water ?? this.water,
      resilience ?? this.resilience,
      name ?? this.name,
    );
  }
}
