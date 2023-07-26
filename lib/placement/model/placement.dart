import 'package:flutter/foundation.dart';

@immutable
class Placement {
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
}
