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
  List<Object?> get props => [energy, water, resilience, name];

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

  static NeighborhoodModel fromString(String input) {
    List<String> parts = input.split(' ');
    String name = parts[1];
    int energy = int.parse(parts[2].substring(2));
    int water = int.parse(parts[3].substring(2));
    int recycling = int.parse(parts[4].substring(2));
    return NeighborhoodModel(
      energy,
      water,
      recycling,
      name,
    );
  }
}
