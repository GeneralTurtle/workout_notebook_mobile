import 'package:test/test.dart';
import 'package:workout_notebook_mobile/models/records/workout_record.dart';
import 'package:workout_notebook_mobile/models/records_factory/workout_record_factory.dart';
import 'package:workout_notebook_mobile/models/workouts/exercise.dart';
import 'package:workout_notebook_mobile/models/workouts/workout.dart';
import 'package:workout_notebook_mobile/states/workout_record_list_state.dart';

void main() {
  test('Test has records', () {
    WorkoutRecordListState state = WorkoutRecordListState([]);
    expect(state.hasRecords, false);

    final record = _createRecord();
    state = WorkoutRecordListState([record]);
    expect(state.hasRecords, true);
  });
}

WorkoutRecord _createRecord() {
  Exercise exercise = Exercise(
    uuid: 'exercise_uuid',
    name: 'exercise_name',
    numberOfRepetitions: 10,
    numberOfSets: 4,
    restTimeInSeconds: 90,
  );
  Workout workout = Workout(
      name: 'workout_name', uuid: 'workout_uuid', exercises: [exercise]);

  final WorkoutRecordFactory factory = WorkoutRecordFactory();
  WorkoutRecord workoutRecord = factory.emptyRecordFromWorkout(workout);
  return workoutRecord;
}
