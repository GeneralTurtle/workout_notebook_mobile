import 'package:flutter/material.dart';
import 'package:workout_notebook_mobile/models/workout.dart';

class WorkoutsState {
  List<Workout> _workouts = [];

  String get pageTitle => "WORKOUTS";

  Widget buildWorkoutList() {
    return _noWorkouts() ? _buildDefaultWidget() : _buildList();
  }

  Text _buildList() => Text('There are workouts');

  Center _buildDefaultWidget() {
    return Center(
      child: Text('There are no workouts'),
    );
  }

  bool _noWorkouts() => _workouts.isEmpty;
}
