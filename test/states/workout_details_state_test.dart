import 'package:test/test.dart';
import 'package:workout_notebook_mobile/models/exercise.dart';
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

  test('Test stop edit state with same name', () {
    _stopEditWithName('name');
  });

  test('Test stop edit state with empty new name', () {
    _stopEditWithNameAndExpectedName('', 'name');
  });

  test('Test get page title', () {
    final pageTitle = 'name';
    Workout workout = Workout(name: pageTitle, uuid: 'uuid');
    WorkoutDetailsState state = WorkoutDetailsState(workout);
    expect(state.pageTitle, pageTitle);
  });

  test('Test no exercises display', () {
    WorkoutDetailsState state = _createNewWorkoutState();
    expect(state.noExercisesDisplayMessage, 'No exercises to display ...');
  });

  test('Test new exercise', () {
    WorkoutDetailsState state = _createNewWorkoutState();
    var listenerNotified = false;
    state.addListener(() => listenerNotified = true);
    expect(state.exercises.length, 0);

    var exercise = state.newExercise();

    expect(state.exercises.length, 1);
    expect(state.exercises[0], exercise);
    expect(listenerNotified, true);
  });

  test('Test update exercise', () {
    WorkoutDetailsState state = _createNewWorkoutState();
    state.newExercise();
    var listenerNotified = false;
    state.addListener(() => listenerNotified = true);
    expect(state.exercises.length, 1);

    String newName = 'newName';
    Exercise exercise = state.exercises[0].copyWith(name: newName);
    state.updateExercise(exercise);

    expect(state.exercises.length, 1);
    expect(state.exercises[0].name, newName);
    expect(listenerNotified, true);
  });
}

void _stopEditWithName(String name) {
  _stopEditWithNameAndExpectedName(name, name);
}

void _stopEditWithNameAndExpectedName(String name, String expectedName) {
  WorkoutDetailsState state = _createNewWorkoutState();
  state.editWorkout();
  var listenerNotified = false;
  state.addListener(() => listenerNotified = true);

  expect(state.isEditing, true);

  state.stopEditWorkout(name);
  expect(state.isEditing, false);
  expect(listenerNotified, true);
  expect(state.pageTitle, expectedName);
}

WorkoutDetailsState _createNewWorkoutState() {
  Workout workout = Workout(name: 'name', uuid: 'uuid');
  WorkoutDetailsState state = WorkoutDetailsState(workout);
  return state;
}
