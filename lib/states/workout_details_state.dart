import 'package:flutter/material.dart';
import 'package:workout_notebook_mobile/models/exercise.dart';
import 'package:workout_notebook_mobile/models/workout.dart';

class WorkoutDetailsState with ChangeNotifier {
  Workout _workout;
  var _isEditing = false;

  WorkoutDetailsState(this._workout);

  bool get isEditing => _isEditing;

  String get pageTitle => _workout.name;

  String get noExercisesDisplayMessage => 'No exercises to display ...';

  Workout get workout => _workout;

  get exercises => _workout.exercises;

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
    if(isTitleDifferent && isNewTitleNotEmpty)
      _workout = _workout.copyWith(name: newTitle);
  }

  void addExercise(Exercise exercise) {
    _workout = _workout.addExercise(exercise);
    notifyListeners();
  }
}
