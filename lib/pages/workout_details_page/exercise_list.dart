import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_notebook_mobile/states/workout_details_state.dart';

class ExerciseList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<WorkoutDetailsState>(context);
    return state.hasExercises
        ? _buildExerciseList(state)
        : _defaultDisplay(state);
  }

  Widget _defaultDisplay(WorkoutDetailsState state) {
    return Center(
      child: Text('${state.noExercisesDisplayMessage}'),
    );
  }

  Widget _buildExerciseList(WorkoutDetailsState state) {
    return ListView.builder(
      itemCount: state.exercises.length,
      itemBuilder: (context, index) => Card(
        child: Text('${state.exercises[index].name}'),
      ),
    );
  }
}
