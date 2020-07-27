import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_notebook_mobile/states/workout_details_state.dart';

class AddExerciseSheet extends StatefulWidget {
  @override
  _AddExerciseSheetState createState() => _AddExerciseSheetState();
}

class _AddExerciseSheetState extends State<AddExerciseSheet> {
  TextEditingController nameController = TextEditingController();
  String name = 'New exercise';
  int numberOfRepetitions = 10;
  int numberOfSeries = 4;
  int restTimeInSeconds = 90;

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<WorkoutDetailsState>(context);
    return Column(
      children: <Widget>[
        _exerciseName(),
        _numberOfSeries(),
        _numberOfRepetitions(),
        _restTime(),
        FlatButton(
          onPressed: () => _addExercise(state),
          child: Text('ADD EXERCISE'),
        ),
      ],
    );
  }

  void _addExercise(WorkoutDetailsState state) {
    name = nameController.text;
    state.addExercise(
      name: name,
      numberOfSeries: numberOfSeries,
      numberOfReps: numberOfRepetitions,
      restTime: restTimeInSeconds,
    );
    Navigator.of(context).pop();
  }

  Widget _incrementDecrementValue(
      Function minusValue, Function addValue, Widget displayText) {
    return Row(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: () {
            setState(() {
              minusValue();
            });
          },
        ),
        displayText,
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            setState(() {
              addValue();
            });
          },
        ),
      ],
    );
  }

  Widget _restTime() {
    return _incrementDecrementValue(
      () => restTimeInSeconds -= 30,
      () => restTimeInSeconds += 30,
      Text('$restTimeInSeconds sec'),
    );
  }

  Widget _numberOfRepetitions() {
    return _incrementDecrementValue(
      () => numberOfRepetitions -= 1,
      () => numberOfRepetitions += 1,
      Text('$numberOfRepetitions reps'),
    );
  }

  Widget _numberOfSeries() {
    return _incrementDecrementValue(
      () => numberOfSeries -= 1,
      () => numberOfSeries += 1,
      Text('$numberOfSeries series'),
    );
  }

  Widget _exerciseName() {
    return TextField(
      controller: nameController,
    );
  }
}
