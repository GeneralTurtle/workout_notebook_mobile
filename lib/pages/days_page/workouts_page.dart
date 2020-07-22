import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_notebook_mobile/pages/days_page/workouts_list.dart';
import 'package:workout_notebook_mobile/states/workouts_state.dart';

class WorkoutsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutsState>(
      builder: (context, workoutsState, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Workouts'),
          ),
          body: Center(
            child: workoutsState.workouts.isEmpty
                ? Text('No days workouts to display...')
                : WorkoutsList(),
          ),
        );
      },
    );
  }
}
