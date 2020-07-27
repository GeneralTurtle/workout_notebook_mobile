import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_notebook_mobile/models/exercise.dart';
import 'package:workout_notebook_mobile/states/workout_details_state.dart';

class ExerciseList extends StatelessWidget {
  final Function(
    BuildContext ctx,
    WorkoutDetailsState state,
    Exercise exercise,
  ) showBottomSheet;

  const ExerciseList({Key key, @required this.showBottomSheet})
      : super(key: key);

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
      itemBuilder: (context, index) => _buildListItem(context, state, index),
    );
  }

  Widget _buildListItem(
      BuildContext context, WorkoutDetailsState state, int index) {
    final exercise = state.exercises[index];
    return GestureDetector(
      onTap: () => showBottomSheet(context, state, exercise),
      child: _exerciseCard(exercise, state),
    );
  }

  Card _exerciseCard(Exercise exercise, WorkoutDetailsState state) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('${exercise.name}'),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => state.deleteExercise(exercise),
          ),
        ],
      ),
    );
  }
}
