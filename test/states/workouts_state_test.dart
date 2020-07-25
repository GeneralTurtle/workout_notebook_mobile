import 'package:test/test.dart';
import 'package:workout_notebook_mobile/states/workouts_state.dart';

void main() {
  test('Test page title', () {
    WorkoutsState state = WorkoutsState();
    expect(state.pageTitle, 'WORKOUTS');
  });

  test('Test no workouts display message', () {
    WorkoutsState state = WorkoutsState();
    expect(state.noWorkoutsDisplayMessage, 'No workouts to display...');
  });

  test('Test new workout', () {
    WorkoutsState state = WorkoutsState();
    final workouts = state.workouts;
    expect(state.hasWorkouts, false);
    expect(workouts.length, 0);

    state.newWorkout();

    expect(true, state.hasWorkouts);
    expect(workouts.length, 1);
    expect(workouts[0].name, 'New workout');
  });

  test('Test delete workout', () {
    WorkoutsState state = _createNoEmptyState();
    final workout = state.workouts[0];
    var deleted = false;
    state.addListener(() => deleted = true);

    state.deleteWorkout(workout.uuid);
    expect(state.hasWorkouts, false);
    expect(deleted, true);
  });

  test('Test select workout', () {
    WorkoutsState state = _createNoEmptyState();
    final workout = state.workouts[0];

    state.selectWorkout(workout.uuid);
    expect(state.selectedWorkout, workout);

    expect(() => state.selectWorkout("wrong"), throwsException);
  });
}

WorkoutsState _createNoEmptyState() {
  final state = WorkoutsState();
  state.newWorkout();
  return state;
}
