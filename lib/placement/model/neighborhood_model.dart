import 'package:flutter/foundation.dart';
import 'package:pearl/placement/model/vector_model.dart';

@immutable
class NeighborhoodModel extends VectorModel {
  const NeighborhoodModel(
    super.energy,
    super.water,
    super.resilience,
  );
}
