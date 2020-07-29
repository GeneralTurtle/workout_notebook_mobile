import 'package:flutter/foundation.dart';

class SetRecord {
  final String uuid;
  final int index;
  final int numberOfRepetitions;
  final double weight;

  SetRecord({
    @required this.uuid,
    @required this.index,
    @required this.numberOfRepetitions,
    @required this.weight,
  });
}
