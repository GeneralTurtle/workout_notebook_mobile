import 'package:flutter/cupertino.dart';
import 'package:workout_notebook_mobile/models/workout.dart';
import 'package:workout_notebook_mobile/states/workouts_state.dart';

class TestState with ChangeNotifier implements WorkoutsState{
  static String title = 'Title';
  static String noWorkoutsMessage = 'nothing';

  bool _hasWorkout = false;

  @override
  String get pageTitle => title;

  @override
  String get noWorkoutsDisplayMessage => noWorkoutsMessage;

  @override
  get hasWorkouts => _hasWorkout;

  @override
  void fetchWorkouts() {}

  @override
  void newWorkout() {
    _hasWorkout = true;
    notifyListeners();
  }

  @override
  List<Workout> get workouts => [];

}