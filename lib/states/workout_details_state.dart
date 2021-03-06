import 'package:flutter/material.dart';
import 'package:workout_notebook_mobile/models/workouts/exercise.dart';
import 'package:workout_notebook_mobile/models/workouts/workout.dart';
import 'package:workout_notebook_mobile/uuid_lib/uuid.dart';

class WorkoutDetailsState with ChangeNotifier {
  Workout _workout;
  var _isEditing = false;

  WorkoutDetailsState(this._workout);

  bool get isEditing => _isEditing;

  String get pageTitle => _workout.name;

  String get noExercisesDisplayMessage => 'No exercises to display ...';

  Workout get workout => _workout;

  List<Exercise> get exercises => _workout.exercises;

  bool get hasExercises => _workout.exercises.isNotEmpty;

  void editWorkout() {
    _isEditing = true;
    notifyListeners();
  }

  void stopEditWorkout(String newTitle) {
    _updateWorkoutName(newTitle);
    _isEditing = false;
    notifyListeners();
  }

  void _updateWorkoutName(String newTitle) {
    var isTitleDifferent = newTitle != pageTitle;
    var isNewTitleNotEmpty = newTitle != '';
    if (isTitleDifferent && isNewTitleNotEmpty)
      _workout = _workout.copyWith(name: newTitle);
  }

  void _addExercise(Exercise exercise) {
    _workout = _workout.addExercise(exercise);
    notifyListeners();
  }

  Exercise newExercise() {
    Uuid uuid = Uuid();
    Exercise exercise = Exercise(
      uuid: uuid.newUuid(),
      name: 'New Exercise',
      numberOfRepetitions: 10,
      numberOfSets: 4,
      restTimeInSeconds: 90,
    );
    _addExercise(exercise);
    return exercise;
  }

  void updateExercise(Exercise exercise) {
    int index = exercises.indexWhere((element) => exercise.uuid == element.uuid);
    exercises.replaceRange(index, index + 1, [exercise]);
    notifyListeners();
  }

  void deleteExercise(Exercise exercise) {
    exercises.remove(exercise);
    notifyListeners();
  }
}
