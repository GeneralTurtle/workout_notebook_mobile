import 'package:flutter/material.dart';
import 'package:workout_notebook_mobile/pages/workouts_page/workout_list.dart';
import 'package:workout_notebook_mobile/provider_lib/providers.dart';
import 'package:workout_notebook_mobile/states/workouts_state.dart';

class WorkoutsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final workoutState = Provider.notListener<WorkoutsState>(context);

    return Scaffold(
      appBar: _buildAppBar(workoutState),
      body: WorkoutList(),
    );
  }

  AppBar _buildAppBar(WorkoutsState state) {
    return AppBar(
      title: Text(state.pageTitle),
    );
  }
}
