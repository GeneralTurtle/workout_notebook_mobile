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

  test('Test has no workouts', () {
    WorkoutsState state = WorkoutsState();
    expect(false, state.hasWorkouts);
  });

  test('Test has workouts', () {
    WorkoutsState state = WorkoutsState();
    state.fetchWorkouts();
    expect(true, state.hasWorkouts);
  });
}
