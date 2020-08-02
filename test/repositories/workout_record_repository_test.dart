import 'package:test/test.dart';
import 'package:workout_notebook_mobile/models/records/workout_record.dart';
import 'package:workout_notebook_mobile/models/records_factory/workout_record_factory.dart';
import 'package:workout_notebook_mobile/models/workouts/exercise.dart';
import 'package:workout_notebook_mobile/models/workouts/workout.dart';
import 'package:workout_notebook_mobile/repositories/workout_record_repository.dart';

void main() {
  test('Test save workout record', () {
    WorkoutRecordRepository repository = WorkoutRecordRepository();
    WorkoutRecord record = _createWorkoutRecord();

    expect(repository.workoutRecords.length, 0);

    repository.saveRecord(record);
    expect(repository.workoutRecords.length, 1);
    expect(repository.workoutRecords[0].uuid, record.uuid);
  });
}

WorkoutRecord _createWorkoutRecord() {
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
