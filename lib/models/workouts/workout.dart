import 'package:flutter/foundation.dart';
import 'package:workout_notebook_mobile/models/workouts/exercise.dart';

class Workout {
  final String name;
  final String uuid;
  final List<Exercise> exercises;

  Workout({
    @required this.name,
    @required this.uuid,
    this.exercises = const [],
  });

  Workout copyWith({String name, String uuid, List<Exercise> exercises}) {
    return Workout(
      name: name == null ? this.name : name,
      uuid: uuid == null ? this.uuid : uuid,
      exercises: exercises == null ? this.exercises : exercises,
    );
  }

  Workout addExercise(Exercise exercise) {
    List<Exercise> newList = [...exercises, exercise];
    return copyWith(exercises: newList);
  }
}
