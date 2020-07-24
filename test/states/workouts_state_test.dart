import 'package:test/test.dart';
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

WorkoutsState _createWorkoutStateWithNoWorkouts() {
  WorkoutsState state = WorkoutsState();
  return state;
}
