import 'package:test/test.dart';
import 'package:workout_notebook_mobile/models/workout.dart';
import 'package:workout_notebook_mobile/states/workout_details_state.dart';

void main() {
  test('Test edit title state', () {
    WorkoutDetailsState state = _createNewWorkoutState();
    var listenerNotified = false;
    state.addListener(() => listenerNotified = true);

    expect(state.isEditingTitle, false);

    state.editTitle();
    expect(state.isEditingTitle, true);
    expect(listenerNotified, true);
  });

  test('Test get page title', () {
    final pageTitle = 'name';
    Workout workout = Workout(pageTitle, 'uuid');
    WorkoutDetailsState state = WorkoutDetailsState(workout);
    expect(state.pageTitle, pageTitle);
  });

  test('Test no exercises display', () {
    WorkoutDetailsState state = _createNewWorkoutState();
    expect(state.noExercisesDisplayMessage, 'No exercises to display ...');
  });
}

WorkoutDetailsState _createNewWorkoutState() {
  Workout workout = Workout('name', 'uuid');
  WorkoutDetailsState state = WorkoutDetailsState(workout);
  return state;
}
