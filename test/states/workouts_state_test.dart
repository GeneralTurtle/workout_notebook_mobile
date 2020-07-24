import 'package:test/test.dart';
import 'package:workout_notebook_mobile/models/workout.dart';
import 'package:workout_notebook_mobile/repositories/workout_repository.dart';
import 'package:workout_notebook_mobile/states/workouts_state.dart';

void main() {
  test('Test page title', () {
    WorkoutsState state = _createWorkoutStateWithNoWorkouts();
    expect('WORKOUTS', state.pageTitle);
  });

  test('Test no workouts display message', () {
    WorkoutsState state = _createWorkoutStateWithNoWorkouts();
    expect('No workouts to display...', state.noWorkoutsDisplayMessage);
  });

  test('Test has no workouts', () {
    WorkoutsState state = _createWorkoutStateWithNoWorkouts();
    state.fetchWorkouts();
    expect(false, state.hasWorkouts);
  });

  test('Test has workouts', () {
    final repositoryWithWorkouts = WorkoutRepositoryWithWorkouts();
    WorkoutsState state = WorkoutsState(repositoryWithWorkouts);
    state.fetchWorkouts();
    expect(true, state.hasWorkouts);
  });

  test('Test new workout', () {
    WorkoutsState state = _createWorkoutStateWithNoWorkouts();
    final workouts = state.workouts;
    expect(false, state.hasWorkouts);
    expect(0, workouts.length);

    state.newWorkout();

    expect(true, state.hasWorkouts);
    expect(1, workouts.length);
    expect('New workout', workouts[0].name);
  });
}

class WorkoutRepositoryWithWorkouts implements WorkoutRepository {
  @override
  List<Workout> fetchWorkouts() {
    return [
      Workout("name", "uuid")
    ];
  }

}

WorkoutsState _createWorkoutStateWithNoWorkouts() {
  WorkoutRepository repository = WorkoutRepository();
  WorkoutsState state = WorkoutsState(repository);
  return state;
}
