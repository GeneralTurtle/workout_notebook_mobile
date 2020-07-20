import 'package:workout_notebook_mobile/models/workout.dart';

class WorkoutsState {

  List<Workout> _workouts = [];

  List<Workout> get workouts => _workouts;

  Future<void> fetchWorkouts() async {
    _workouts = [
      Workout('Day 1 : Chest Day', 'uuid1'),
      Workout('Day 2 : Leg Day', 'uuid2'),
    ];
  }

}