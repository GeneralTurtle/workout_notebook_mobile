import 'package:flutter/material.dart';
import 'package:workout_notebook_mobile/models/workout.dart';

class WorkoutDetailsState with ChangeNotifier {
  Workout _workout;
  var _isEditing = false;

  WorkoutDetailsState(this._workout);

  bool get isEditing => _isEditing;

  String get pageTitle => _workout.name;

  String get noExercisesDisplayMessage => 'No exercises to display ...';

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
    if(isTitleDifferent)
      _workout = _workout.copyWith(name: newTitle);
  }
}
