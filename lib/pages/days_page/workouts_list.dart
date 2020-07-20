import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_notebook_mobile/states/workouts_state.dart';

class WorkoutsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutsState>(
        builder: (context, workoutState, child) {
          return ListView.builder(
            itemCount: workoutState.workouts.length,
            itemBuilder: (context, index) {
              final workout = workoutState.workouts[index];
              return Card(
                child: Center(
                  child: Text('${workout.name}'),
                ),
              );
            },
          );
        },
        child: Text('There are workouts'));
  }
}
