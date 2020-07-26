import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_notebook_mobile/pages/workouts_page/workout_list_item.dart';
import 'package:workout_notebook_mobile/states/workouts_state.dart';

class WorkoutList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<WorkoutsState>(context);
    return _buildList(state);
  }

  Widget _buildList(WorkoutsState state) {
    return state.hasWorkouts
        ? _buildListOfWorkouts(state)
        : _buildNoWorkoutsView(state);
  }

  Widget _buildNoWorkoutsView(WorkoutsState state) {
    return Center(
      child: Text(state.noWorkoutsDisplayMessage),
    );
  }

  Widget _buildListOfWorkouts(WorkoutsState state) {
    return ListView.builder(
      itemCount: state.workouts.length,
      itemBuilder: (context, index) =>
          WorkoutListItem(workout: state.workouts[index]),
    );
  }
}
