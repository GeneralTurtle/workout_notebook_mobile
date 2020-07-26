import 'package:flutter/material.dart';
import 'package:workout_notebook_mobile/models/workout.dart';

class WorkoutDetailsState with ChangeNotifier {
  Workout _workout;
  var _isEditingTitle = false;

  WorkoutDetailsState(this._workout);

  bool get isEditingTitle => _isEditingTitle;

  String get pageTitle => _workout.name;

  void editTitle() {
    _isEditingTitle = true;
    notifyListeners();
  }
}
