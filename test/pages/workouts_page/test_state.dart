import 'package:workout_notebook_mobile/states/workouts_state.dart';

abstract class TestState implements WorkoutsState {
  static String title = 'Title';
  static String noWorkoutsMessage = 'nothing';

  final bool hasWorkout;

  TestState(this.hasWorkout);

  @override
  String get pageTitle => title;

  @override
  String get noWorkoutsDisplayMessage => noWorkoutsMessage;

  @override
  get hasWorkouts => hasWorkout;

  @override
  void fetchWorkouts() {}
}

class TestStateNoWorkout extends TestState {
  TestStateNoWorkout() : super(false);
}

class TestStateWithWorkout extends TestState {
  TestStateWithWorkout() : super(true);
}
