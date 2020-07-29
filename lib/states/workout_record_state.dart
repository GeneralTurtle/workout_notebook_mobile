import 'package:workout_notebook_mobile/models/records/exercise_record.dart';
import 'package:workout_notebook_mobile/models/records/workout_record.dart';

class WorkoutRecordState {

  final WorkoutRecord _workoutRecord;

  WorkoutRecordState(this._workoutRecord);

  String get noExerciseDisplayMessage => 'There are no exercises to display...';

  List<ExerciseRecord> get exerciseRecords => _workoutRecord.exerciseRecords;

  String get workoutName => _workoutRecord.workoutName;

  bool get hasExercisesRecords => exerciseRecords.isNotEmpty;

}