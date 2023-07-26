import 'package:flutter/foundation.dart';
import 'package:pearl/placement/model/vector_model.dart';

@immutable
class HomeownerModel extends VectorModel {
  final String name;
  final List<String> preferences;

  const HomeownerModel(
    super.energy,
    super.water,
    super.resilience,
    this.name,
    this.preferences,
  );

  @override
  HomeownerModel copyWith({
    int? energy,
    int? water,
    int? resilience,
    String? name,
    List<String>? preferences,
  }) {
    return HomeownerModel(
      energy ?? this.energy,
      water ?? this.water,
      resilience ?? this.resilience,
      name ?? this.name,
      preferences ?? this.preferences,
    );
  }

  static HomeownerModel fromString(String input) {
    List<String> parts = input.split(' ');
    String name = parts[1];
    int energy = int.parse(parts[2].substring(2));
    int water = int.parse(parts[3].substring(2));
    int recycling = int.parse(parts[4].substring(2));
    List<String> neighbors = parts[5].split('>');
    return HomeownerModel(
      energy,
      water,
      recycling,
      name,
      neighbors,
    );
  }
}
