import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_notebook_mobile/models/workouts/exercise.dart';
import 'package:workout_notebook_mobile/states/workout_details_state.dart';

class WorkoutRecordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<WorkoutDetailsState>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Play: ${state.pageTitle}'),
      ),
      body: _pageBody(state),
    );
  }

  Widget _pageBody(WorkoutDetailsState state) {
    return state.hasExercises
        ? _exerciseRecordsList(state)
        : _defaultDisplay(state);
  }

  Widget _defaultDisplay(WorkoutDetailsState state) {
    return Center(
      child: Text('${state.noExercisesDisplayMessage}'),
    );
  }

  Widget _exerciseRecordsList(WorkoutDetailsState state) {
    return ListView.builder(
      itemCount: state.exercises.length,
      itemBuilder: (context, index) =>
          _exerciseRecordItem(state.exercises[index]),
    );
  }

  Widget _exerciseRecordItem(Exercise exercise) {
    return Column(
      children: <Widget>[
        Text('${exercise.name}'),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: exercise.numberOfSets,
          itemBuilder: (context, index) =>
              _recordLine(index + 1, exercise.numberOfRepetitions),
        ),
        Divider(),
      ],
    );
  }

  Widget _recordLine(int index, int numberOfRepetitions) {
    return Row(
      children: <Widget>[
        Text('Serie $index'),
        SizedBox(width: 100, child: TextField()),
        Text('reps'),
        SizedBox(width: 100, child: TextField()),
        Text('kg'),
      ],
    );
  }
}
