import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_notebook_mobile/models/exercise.dart';
import 'package:workout_notebook_mobile/states/workout_details_state.dart';

class WorkoutFloatingButton extends StatelessWidget {
  final Function(
    BuildContext ctx,
    WorkoutDetailsState state,
    Exercise exercise,
  ) showBottomSheet;

  WorkoutFloatingButton(this.showBottomSheet);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<WorkoutDetailsState>(context);
    return state.isEditing
        ? _addExerciseButton(context, state)
        : _playWorkout();
  }

  Widget _addExerciseButton(
    BuildContext context,
    WorkoutDetailsState state,
  ) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () => _showNewExerciseBottomSheet(context, state),
    );
  }

  Widget _playWorkout() {
    return FloatingActionButton(
      child: Icon(Icons.play_arrow),
      onPressed: () {},
    );
  }

  void _showNewExerciseBottomSheet(
    BuildContext ctx,
    WorkoutDetailsState state,
  ) {
    final exercise = state.newExercise();
    showBottomSheet(ctx, state, exercise);
  }
}
