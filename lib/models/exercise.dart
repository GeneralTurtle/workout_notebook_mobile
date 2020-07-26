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
}
