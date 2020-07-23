import 'package:workout_notebook_mobile/models/workout.dart';

class WorkoutsState {
  List<Workout> _workouts = [];

  String get pageTitle => 'WORKOUTS';

  String get noWorkoutsDisplayMessage => 'No workouts to display...';

  get hasWorkouts => _workouts.isNotEmpty;

  void fetchWorkouts() {
    _workouts = [
      Workout("name", "uuid"),
    ];
  }
}
