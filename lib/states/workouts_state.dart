import 'package:workout_notebook_mobile/models/workout.dart';
import 'package:workout_notebook_mobile/repositories/workout_repository.dart';

class WorkoutsState {
  final WorkoutRepository _repository;

  List<Workout> _workouts = [];

  WorkoutsState(this._repository);

  String get pageTitle => 'WORKOUTS';

  String get noWorkoutsDisplayMessage => 'No workouts to display...';

  get hasWorkouts => _workouts.isNotEmpty;

  void fetchWorkouts() {
    _workouts = _repository.fetchWorkouts();
  }
}
