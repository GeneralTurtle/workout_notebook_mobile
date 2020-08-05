import 'package:test/test.dart';
import 'package:workout_notebook_mobile/models/records/exercise_record.dart';
import 'package:workout_notebook_mobile/models/records/workout_record.dart';
import 'package:workout_notebook_mobile/models/records_factory/workout_record_factory.dart';
import 'package:workout_notebook_mobile/models/workouts/exercise.dart';
import 'package:workout_notebook_mobile/models/workouts/workout.dart';
import 'package:workout_notebook_mobile/repositories/workout_record_repository.dart';
import 'package:workout_notebook_mobile/states/workout_record_state.dart';

void main() {
  test('Test no exercises to record display message', () {
    WorkoutRecord record = _createRecord();
    WorkoutRecordState state = _createWorkoutRecordState(record);
    expect(
        state.noExerciseDisplayMessage, 'There are no exercises to display...');
  });

  test('Test get workout name', () {
    WorkoutRecord record = _createRecord();
    WorkoutRecordState state = _createWorkoutRecordState(record);
    state.fetchRecord(record.uuid);
    expect(state.workoutName, 'workout_name');
  });

  test('Test get exercise records', () {
    WorkoutRecord record = _createRecord();
    WorkoutRecordState state = _createWorkoutRecordState(record);
    state.fetchRecord(record.uuid);
    List<ExerciseRecord> exerciseRecords = state.exerciseRecords;
    expect(exerciseRecords.length, 1);
  });

  test('Test fetch record', () {
    WorkoutRecord record = _createRecord();
    WorkoutRecordState state = _createWorkoutRecordState(record);
    expect(state.workoutRecord, null);
  });
}

WorkoutRecordState _createWorkoutRecordState(WorkoutRecord record) {
  WorkoutRecordRepository repository = _createRepository(record);
  WorkoutRecordState state = WorkoutRecordState(repository);
  return state;
}

WorkoutRecordRepository _createRepository(WorkoutRecord record) {
  WorkoutRecordRepository repository = WorkoutRecordRepository([record]);
  return repository;
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
