import 'package:equatable/equatable.dart';
import 'package:pearl/placement/placement.dart';

class Placement extends Equatable {
  final String name;
  final int fit;

  const Placement(
    this.name,
    this.fit,
  );

  Placement copyWith({
    String? name,
    int? fit,
  }) {
    return Placement(
      name ?? this.name,
      fit ?? this.fit,
    );
  }

  static Placement place(
    HomeownerModel homeowner,
    NeighborhoodModel neighborhood,
  ) {
    return Placement(
      homeowner.name,
      homeowner.energy * neighborhood.energy +
          homeowner.water * neighborhood.water +
          homeowner.resilience * neighborhood.resilience,
    );
  }

  @override
  List<Object?> get props => [name, fit];

  @override
  String toString() {
    return '$name($fit)';
  }
}
