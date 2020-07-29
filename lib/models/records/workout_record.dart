import 'package:flutter/foundation.dart';
import 'package:workout_notebook_mobile/models/records/exercise_record.dart';

class WorkoutRecord {
  final String uuid;
  final String workoutUuid;
  final String workoutName;
  final List<ExerciseRecord> exerciseRecords;

  WorkoutRecord({
    @required this.uuid,
    @required this.workoutUuid,
    @required this.workoutName,
    @required this.exerciseRecords,
  });
}
