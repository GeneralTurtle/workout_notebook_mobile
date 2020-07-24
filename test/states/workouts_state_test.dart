import 'package:test/test.dart';
import 'package:workout_notebook_mobile/states/workouts_state.dart';

void main() {
  test('Test page title', () {
    WorkoutsState state = WorkoutsState();
    expect('WORKOUTS', state.pageTitle);
  });

  test('Test no workouts display message', () {
    WorkoutsState state = WorkoutsState();
    expect('No workouts to display...', state.noWorkoutsDisplayMessage);
  });

  test('Test new workout', () {
    WorkoutsState state = WorkoutsState();
    final workouts = state.workouts;
    expect(false, state.hasWorkouts);
    expect(0, workouts.length);

    state.newWorkout();

    expect(true, state.hasWorkouts);
    expect(1, workouts.length);
    expect('New workout', workouts[0].name);
  });

  test('Test delete workout', () {
    WorkoutsState state = _createNoEmptyState();
    final workout = state.workouts[0];
    var deleted = false;
    state.addListener(() => deleted = true);

    state.deleteWorkout(workout.uuid);
    expect(false, state.hasWorkouts);
    expect(true, deleted);

  });
}

WorkoutsState _createNoEmptyState() {
  final state = WorkoutsState();
  state.newWorkout();
  expect(true, state.hasWorkouts);
  return state;
}
