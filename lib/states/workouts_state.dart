import 'package:flutter/material.dart';
import 'package:workout_notebook_mobile/models/workouts/workout.dart';
import 'package:workout_notebook_mobile/uuid_lib/uuid.dart';

class WorkoutsState extends ChangeNotifier {
  List<Workout> _workouts = [];

  String get pageTitle => 'WORKOUTS';

  String get noWorkoutsDisplayMessage => 'No workouts to display...';

  get hasWorkouts => _workouts.isNotEmpty;

  List<Workout> get workouts => _workouts;

  void newWorkout() {
    final uuid = Uuid();
    final name = 'New workout';
    _workouts.add(Workout(name: name, uuid:  uuid.newUuid()));
    notifyListeners();
  }

  void deleteWorkout(String uuid) {
    _workouts.removeWhere((element) => uuid == element.uuid);
    notifyListeners();
  }

  void updateWorkout(Workout workout) {
    int index = _workouts.indexWhere((element) => workout.uuid == element.uuid);
    _workouts.replaceRange(index, index + 1, [workout]);
    notifyListeners();
  }
}
