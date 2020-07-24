import 'package:flutter/material.dart';
import 'package:workout_notebook_mobile/models/workout.dart';
import 'package:workout_notebook_mobile/repositories/workout_repository.dart';
import 'package:workout_notebook_mobile/uuid_lib/uuid.dart';

class WorkoutsState extends ChangeNotifier {
  final WorkoutRepository _repository;

  List<Workout> _workouts = [];

  WorkoutsState(this._repository);

  String get pageTitle => 'WORKOUTS';

  String get noWorkoutsDisplayMessage => 'No workouts to display...';

  get hasWorkouts => _workouts.isNotEmpty;

  List<Workout> get workouts => _workouts;

  void fetchWorkouts() {
    _workouts = _repository.fetchWorkouts();
  }

  void newWorkout() {
    final uuid = Uuid();
    final name = 'New workout';
    _workouts.add(Workout(name, uuid.newUuid()));
    notifyListeners();
  }
}
