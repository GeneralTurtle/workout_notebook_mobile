import 'package:flutter/material.dart';
import 'package:workout_notebook_mobile/provider_lib/providers.dart';
import 'package:workout_notebook_mobile/states/workouts_state.dart';

class WorkoutList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.notListener<WorkoutsState>(context);
    return buildNoWorkoutsView(state);
  }

  Widget buildNoWorkoutsView(WorkoutsState state) {
    return Center(
      child: Text(state.noWorkoutsDisplayMessage),
    );
  }
}
