import 'package:test/test.dart';
import 'package:workout_notebook_mobile/states/workouts_state.dart';

void main() {
  test('Test page title', () {
    WorkoutsState state = WorkoutsState();
    expect("WORKOUTS", state.pageTitle);
  });
}
