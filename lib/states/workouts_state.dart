import 'package:flutter/material.dart';
import 'package:workout_notebook_mobile/models/workout.dart';
import 'package:workout_notebook_mobile/uuid_lib/uuid.dart';

class WorkoutsState extends ChangeNotifier {
  List<Workout> _workouts = [];
  Workout _selectedWorkout;

  String get pageTitle => 'WORKOUTS';

  String get noWorkoutsDisplayMessage => 'No workouts to display...';

  get hasWorkouts => _workouts.isNotEmpty;

  List<Workout> get workouts => _workouts;

  Workout get selectedWorkout => _selectedWorkout;

  void newWorkout() {
    final uuid = Uuid();
    final name = 'New workout';
    _workouts.add(Workout(name, uuid.newUuid()));
    notifyListeners();
  }

  void deleteWorkout(String uuid) {
    _workouts.removeWhere((element) => uuid == element.uuid);
    notifyListeners();
  }

  void selectWorkout(String uuid) {
    _selectedWorkout = _workouts.singleWhere((element) => element.uuid == uuid, orElse: () => throw Exception('No workout found'));
  }
}
