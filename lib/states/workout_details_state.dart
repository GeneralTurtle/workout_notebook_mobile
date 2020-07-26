import 'package:workout_notebook_mobile/models/workout.dart';

class WorkoutDetailsState {
  Workout _workout;
  var _isEditingTitle = false;

  WorkoutDetailsState(this._workout);

  bool get isEditingTitle => _isEditingTitle;

  String get pageTitle => _workout.name;

  void editTitle() {
    _isEditingTitle = true;
  }

}
