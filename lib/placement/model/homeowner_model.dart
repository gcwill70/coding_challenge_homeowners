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
}
