import 'package:test/test.dart';
import 'package:workout_notebook_mobile/models/exercise.dart';
import 'package:workout_notebook_mobile/models/records/exercise_record.dart';
import 'package:workout_notebook_mobile/models/records/set_record.dart';
import 'package:workout_notebook_mobile/models/records/workout_record.dart';
import 'package:workout_notebook_mobile/models/records_factory/workout_record_factory.dart';
import 'package:workout_notebook_mobile/models/workout.dart';

void main() {
  test('Test create empty record from workout', () {
    WorkoutRecordFactory factory = WorkoutRecordFactory();

    Exercise exercise = Exercise(
      uuid: 'uuid',
      name: 'name',
      numberOfRepetitions: 10,
      numberOfSets: 4,
      restTimeInSeconds: 90,
    );
    Workout workout = Workout(
      name: 'name',
      uuid: 'uuid',
      exercises: [exercise]
    );

    WorkoutRecord workoutRecord  = factory.emptyRecordFromWorkout(workout);
    expect(workoutRecord.workoutName, workout.name);
    expect(workoutRecord.workoutUuid, workout.uuid);

    expect(workoutRecord.exerciseRecords.length, workout.exercises.length);
    for(int i = 0; i < workoutRecord.exerciseRecords.length; i++) {
      ExerciseRecord exerciseRecord = workoutRecord.exerciseRecords[i];
      Exercise exercise = workout.exercises[i];
      expect(exerciseRecord.exerciseName, exercise.name);
      expect(exerciseRecord.exerciseUuid, exercise.uuid);

      expect(exerciseRecord.setRecords.length, exercise.numberOfSets);
      for(int j = 0; j < exerciseRecord.setRecords.length; j++) {
        SetRecord setRecord = exerciseRecord.setRecords[j];
        expect(setRecord.index, j);
        expect(setRecord.numberOfRepetitions, exercise.numberOfRepetitions);
        expect(setRecord.weight, 0);
      }
    }
  });
}