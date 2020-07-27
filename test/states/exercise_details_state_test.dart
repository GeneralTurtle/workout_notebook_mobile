import 'package:test/test.dart';
import 'package:workout_notebook_mobile/models/exercise.dart';
import 'package:workout_notebook_mobile/states/exercise_details_state.dart';

void main() {
  test('Test update exercise', () {
    Exercise exercise = _defaultExercise();
    ExerciseDetailsState state = ExerciseDetailsState(exercise);
    String newName = 'newName';
    state.updateName(newName);
    expect(state.exercise.name, newName);
  });

  test('Test increment number of series', () {
    Exercise exercise = _defaultExercise();
    ExerciseDetailsState state = ExerciseDetailsState(exercise);
    state.incrementNumberOfSeries();
    expect(state.exercise.numberOfSeries, exercise.numberOfSeries + 1);
  });

  test('Test decrement number of series', () {
    Exercise exercise = _defaultExercise();
    ExerciseDetailsState state = ExerciseDetailsState(exercise);
    state.decrementNumberOfSeries();
    expect(state.exercise.numberOfSeries, exercise.numberOfSeries - 1);
  });

  test('Test increment number of repetitions', () {
    Exercise exercise = _defaultExercise();
    ExerciseDetailsState state = ExerciseDetailsState(exercise);
    state.incrementNumberOfRepetitions();
    expect(state.exercise.numberOfRepetitions, exercise.numberOfRepetitions + 1);
  });

  test('Test decrement number of repetitions', () {
    Exercise exercise = _defaultExercise();
    ExerciseDetailsState state = ExerciseDetailsState(exercise);
    state.decrementNumberOfRepetitions();
    expect(state.exercise.numberOfRepetitions, exercise.numberOfRepetitions - 1);
  });

  test('Test increment rest time', () {
    Exercise exercise = _defaultExercise();
    ExerciseDetailsState state = ExerciseDetailsState(exercise);
    state.incrementRestTime();
    expect(state.exercise.restTimeInSeconds, exercise.restTimeInSeconds + 30);
  });

  test('Test decrement rest time', () {
    Exercise exercise = _defaultExercise();
    ExerciseDetailsState state = ExerciseDetailsState(exercise);
    state.decrementRestTime();
    expect(state.exercise.restTimeInSeconds, exercise.restTimeInSeconds - 30);
  });
}

Exercise _defaultExercise() {
  return Exercise(
  uuid: 'uuid',
  name: 'name',
  numberOfRepetitions: 10,
  numberOfSeries: 4,
  restTimeInSeconds: 90,
  );
}
