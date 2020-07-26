import 'package:test/test.dart';
import 'package:workout_notebook_mobile/models/workout.dart';
import 'package:workout_notebook_mobile/states/workout_details_state.dart';

void main() {
  test('Test edit state', () {
    WorkoutDetailsState state = _createNewWorkoutState();
    var listenerNotified = false;
    state.addListener(() => listenerNotified = true);

    expect(state.isEditing, false);

    state.editWorkout();
    expect(state.isEditing, true);
    expect(listenerNotified, true);
  });

  test('Test stop edit state with new name', () {
    _stopEditWithName('toto');
  });

  test('Test stop edit state with same name name', () {
    _stopEditWithName('name');
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

void _stopEditWithName(String name) {
  WorkoutDetailsState state = _createNewWorkoutState();
  state.editWorkout();
  var listenerNotified = false;
  state.addListener(() => listenerNotified = true);

  expect(state.isEditing, true);

  final newName = name;
  state.stopEditWorkout(newName);
  expect(state.isEditing, false);
  expect(listenerNotified, true);
  expect(state.pageTitle, newName);
}

WorkoutDetailsState _createNewWorkoutState() {
  Workout workout = Workout('name', 'uuid');
  WorkoutDetailsState state = WorkoutDetailsState(workout);
  return state;
}
