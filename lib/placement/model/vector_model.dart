import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class VectorModel extends Equatable {
  final int energy;
  final int water;
  final int resilience;

  const VectorModel(
    this.energy,
    this.water,
    this.resilience,
  );

  @override
  List<Object?> get props => [energy, water, resilience];

  VectorModel copyWith({
    int? energy,
    int? water,
    int? resilience,
  }) {
    return VectorModel(
      energy ?? this.energy,
      water ?? this.water,
      resilience ?? this.resilience,
    );
  }
}
