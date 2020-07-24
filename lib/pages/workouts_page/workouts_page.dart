import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_notebook_mobile/pages/workouts_page/workout_list.dart';
import 'package:workout_notebook_mobile/states/workouts_state.dart';

class WorkoutsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final workoutState = Provider.of<WorkoutsState>(context, listen: false);
    workoutState.fetchWorkouts();

    return Scaffold(
      appBar: _buildAppBar(workoutState),
      body: WorkoutList(),
      floatingActionButton: _buildAddWorkoutButton(workoutState),
    );
  }

  Widget _buildAddWorkoutButton(WorkoutsState state) {
    return FloatingActionButton(
      onPressed: () => state.newWorkout(),
      child: Icon(Icons.add),
    );
  }

  AppBar _buildAppBar(WorkoutsState state) {
    return AppBar(
      title: Text(state.pageTitle),
    );
  }
}
