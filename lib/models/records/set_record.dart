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

  SetRecord copyWith({
    uuid,
    index,
    numberOfRepetitions,
    weight,
  }) {
    return SetRecord(
      uuid: uuid == null ? this.uuid : uuid,
      index: index == null ? this.index : index,
      numberOfRepetitions: numberOfRepetitions == null
          ? this.numberOfRepetitions
          : numberOfRepetitions,
      weight: weight == null ? this.weight : weight,
    );
  }
}
