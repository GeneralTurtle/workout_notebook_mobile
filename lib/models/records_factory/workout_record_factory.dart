import 'package:workout_notebook_mobile/models/records/exercise_record.dart';
import 'package:workout_notebook_mobile/models/records/set_record.dart';
import 'package:workout_notebook_mobile/models/records/workout_record.dart';
import 'package:workout_notebook_mobile/models/workouts/exercise.dart';
import 'package:workout_notebook_mobile/models/workouts/workout.dart';
import 'package:workout_notebook_mobile/uuid_lib/uuid.dart';

class WorkoutRecordFactory {

  static final Uuid _uuid = Uuid();

  Workout _workout;

  WorkoutRecord emptyRecordFromWorkout(Workout workout) {
    _workout = workout;
    List<ExerciseRecord> exerciseRecords = _createExerciseRecordsList();
    return _newWorkoutRecord(exerciseRecords);
  }

  List<ExerciseRecord> _createExerciseRecordsList() {
    List<ExerciseRecord> exerciseRecords = [];
    _workout.exercises.forEach((exercise) {
      _addRecordFromExerciseToList(exercise, exerciseRecords);
    });
    return exerciseRecords;
  }

  WorkoutRecord _newWorkoutRecord(List<ExerciseRecord> exerciseRecords) {
    WorkoutRecord workoutRecord = WorkoutRecord(
      uuid: _uuid.newUuid(),
      workoutName: _workout.name,
      workoutUuid: _workout.uuid,
      exerciseRecords: exerciseRecords
    );
    return workoutRecord;
  }

  void _addRecordFromExerciseToList(Exercise element, List<ExerciseRecord> exerciseRecords) {
    ExerciseRecord exerciseRecord = _recordFromExercise(element);
    exerciseRecords.add(exerciseRecord);
  }

  ExerciseRecord _recordFromExercise(Exercise element) {
    List<SetRecord> setRecords = _createSetRecords(element);
    ExerciseRecord exerciseRecord = _createExerciseRecord(setRecords, element);
    return exerciseRecord;
  }

  ExerciseRecord _createExerciseRecord(List<SetRecord> setRecords, Exercise element) {
    ExerciseRecord exerciseRecord = ExerciseRecord(
      uuid: _uuid.newUuid(),
      setRecords: setRecords,
      exerciseName: element.name,
      exerciseUuid: element.uuid,
    );
    return exerciseRecord;
  }

  List<SetRecord> _createSetRecords(Exercise element) {
    List<SetRecord> setRecords = [];
    for(int i = 0; i < element.numberOfSets; i++) {
      SetRecord setRecord = SetRecord(
        uuid: _uuid.newUuid(),
        index: i,
        numberOfRepetitions: element.numberOfRepetitions,
        weight: 0,
      );
      setRecords.add(setRecord);
    }
    return setRecords;
  }

}