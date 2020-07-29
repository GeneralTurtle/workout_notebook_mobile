import 'package:flutter/foundation.dart';
import 'package:workout_notebook_mobile/models/records/set_record.dart';

class ExerciseRecord {
  final String uuid;
  final List<SetRecord> setRecords;
  final String exerciseName;
  final String exerciseUuid;

  ExerciseRecord({
    @required this.uuid,
    @required this.setRecords,
    @required this.exerciseName,
    @required this.exerciseUuid,
  });
}
