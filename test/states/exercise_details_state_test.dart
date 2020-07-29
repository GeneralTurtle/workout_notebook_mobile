import 'package:test/test.dart';
import 'file:///C:/Dev/workout_notebook_mobile/lib/models/workouts/exercise.dart';
import 'package:workout_notebook_mobile/states/exercise_details_state.dart';

void main() {
  test('Test update exercise', () {
    Exercise exercise = _defaultExercise();
    ExerciseDetailsState state = ExerciseDetailsState(exercise);
    var listenerNotified = false;
    state.addListener(() => listenerNotified = true);

    String newName = 'newName';
    state.updateName(newName);
    expect(state.exercise.name, newName);
    expect(listenerNotified, true);
  });

  test('Test increment number of series', () {
    Exercise exercise = _defaultExercise();
    ExerciseDetailsState state = ExerciseDetailsState(exercise);
    var listenerNotified = false;
    state.addListener(() => listenerNotified = true);

    state.incrementNumberOfSeries();
    expect(state.exercise.numberOfSets, exercise.numberOfSets + 1);
    expect(listenerNotified, true);
  });

  test('Test decrement number of series', () {
    Exercise exercise = _defaultExercise();
    ExerciseDetailsState state = ExerciseDetailsState(exercise);
    var listenerNotified = false;
    state.addListener(() => listenerNotified = true);

    state.decrementNumberOfSeries();
    expect(state.exercise.numberOfSets, exercise.numberOfSets - 1);
    expect(listenerNotified, true);
  });

  test('Test increment number of repetitions', () {
    Exercise exercise = _defaultExercise();
    ExerciseDetailsState state = ExerciseDetailsState(exercise);
    var listenerNotified = false;
    state.addListener(() => listenerNotified = true);

    state.incrementNumberOfRepetitions();
    expect(state.exercise.numberOfRepetitions, exercise.numberOfRepetitions + 1);
    expect(listenerNotified, true);
  });

  test('Test decrement number of repetitions', () {
    Exercise exercise = _defaultExercise();
    ExerciseDetailsState state = ExerciseDetailsState(exercise);
    var listenerNotified = false;
    state.addListener(() => listenerNotified = true);

    state.decrementNumberOfRepetitions();
    expect(state.exercise.numberOfRepetitions, exercise.numberOfRepetitions - 1);
    expect(listenerNotified, true);
  });

  test('Test increment rest time', () {
    Exercise exercise = _defaultExercise();
    ExerciseDetailsState state = ExerciseDetailsState(exercise);
    var listenerNotified = false;
    state.addListener(() => listenerNotified = true);

    state.incrementRestTime();
    expect(state.exercise.restTimeInSeconds, exercise.restTimeInSeconds + 30);
    expect(listenerNotified, true);
  });

  test('Test decrement rest time', () {
    Exercise exercise = _defaultExercise();
    ExerciseDetailsState state = ExerciseDetailsState(exercise);
    var listenerNotified = false;
    state.addListener(() => listenerNotified = true);

    state.decrementRestTime();
    expect(state.exercise.restTimeInSeconds, exercise.restTimeInSeconds - 30);
    expect(listenerNotified, true);
  });
}

Exercise _defaultExercise() {
  return Exercise(
  uuid: 'uuid',
  name: 'name',
  numberOfRepetitions: 10,
  numberOfSets: 4,
  restTimeInSeconds: 90,
  );
}
