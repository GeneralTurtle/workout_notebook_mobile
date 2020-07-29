import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_notebook_mobile/states/exercise_details_state.dart';
import 'package:workout_notebook_mobile/states/workout_details_state.dart';

class AddExerciseSheet extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final workoutState =
        Provider.of<WorkoutDetailsState>(context, listen: false);
    final exerciseState = Provider.of<ExerciseDetailsState>(context);
    return Column(
      children: <Widget>[
        _exerciseName(exerciseState),
        _numberOfSeries(exerciseState),
        _numberOfRepetitions(exerciseState),
        _restTime(exerciseState),
        FlatButton(
          onPressed: () => _addExercise(context, workoutState, exerciseState),
          child: Text('SAVE'),
        ),
      ],
    );
  }

  void _addExercise(
    BuildContext context,
    WorkoutDetailsState workoutState,
    ExerciseDetailsState exerciseState,
  ) {
    workoutState.updateExercise(exerciseState.exercise);
    Navigator.of(context).pop();
  }

  Widget _incrementDecrementValue(
    Function minusValue,
    Function addValue,
    Widget displayText,
  ) {
    return Row(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: minusValue,
        ),
        displayText,
        IconButton(
          icon: Icon(Icons.add),
          onPressed: addValue,
        ),
      ],
    );
  }

  Widget _restTime(ExerciseDetailsState exerciseState) {
    return _incrementDecrementValue(
      exerciseState.decrementRestTime,
      exerciseState.incrementRestTime,
      Text('${exerciseState.exercise.restTimeInSeconds} sec'),
    );
  }

  Widget _numberOfRepetitions(ExerciseDetailsState exerciseState) {
    return _incrementDecrementValue(
      exerciseState.decrementNumberOfRepetitions,
      exerciseState.incrementNumberOfRepetitions,
      Text('${exerciseState.exercise.numberOfRepetitions} reps'),
    );
  }

  Widget _numberOfSeries(ExerciseDetailsState exerciseState) {
    return _incrementDecrementValue(
      exerciseState.decrementNumberOfSeries,
      exerciseState.incrementNumberOfSeries,
      Text('${exerciseState.exercise.numberOfSets} series'),
    );
  }

  Widget _exerciseName(ExerciseDetailsState exerciseState) {
    return TextField(
      controller: nameController,
      onSubmitted: (value) => exerciseState.updateName(value),
      decoration: InputDecoration(
        hintText: exerciseState.exercise.name,
      ),
    );
  }
}
