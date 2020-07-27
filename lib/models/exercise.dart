import 'package:flutter/foundation.dart';

class Exercise {
  final String uuid;
  final String name;
  final int numberOfRepetitions;
  final int numberOfSeries;
  final int restTimeInSeconds;

  Exercise({
    @required this.uuid,
    @required this.name,
    @required this.numberOfRepetitions,
    @required this.numberOfSeries,
    @required this.restTimeInSeconds,
  });

  Exercise copyWith({
    uuid,
    name,
    numberOfRepetitions,
    numberOfSeries,
    restTimeInSeconds,
  }) {
    return Exercise(
      uuid: uuid == null ? this.uuid : uuid,
      name: name == null ? this.name : name,
      numberOfRepetitions: numberOfRepetitions == null
          ? this.numberOfRepetitions
          : numberOfRepetitions,
      numberOfSeries:
          numberOfSeries == null ? this.numberOfSeries : numberOfSeries,
      restTimeInSeconds: restTimeInSeconds == null
          ? this.restTimeInSeconds
          : restTimeInSeconds,
    );
  }
}
