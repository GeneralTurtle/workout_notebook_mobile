import 'package:flutter/foundation.dart';

class Exercise {
  final String uuid;
  final String name;
  final int numberOfRepetitions;
  final int numberOfSets;
  final int restTimeInSeconds;

  Exercise({
    @required this.uuid,
    @required this.name,
    @required this.numberOfRepetitions,
    @required this.numberOfSets,
    @required this.restTimeInSeconds,
  });

  Exercise copyWith({
    uuid,
    name,
    numberOfRepetitions,
    numberOfSet,
    restTimeInSeconds,
  }) {
    return Exercise(
      uuid: uuid == null ? this.uuid : uuid,
      name: name == null ? this.name : name,
      numberOfRepetitions: numberOfRepetitions == null
          ? this.numberOfRepetitions
          : numberOfRepetitions,
      numberOfSets:
          numberOfSet == null ? this.numberOfSets : numberOfSet,
      restTimeInSeconds: restTimeInSeconds == null
          ? this.restTimeInSeconds
          : restTimeInSeconds,
    );
  }
}
