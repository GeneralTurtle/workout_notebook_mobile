import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_notebook_mobile/states/workouts_state.dart';

class WorkoutDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<WorkoutsState>(context);
    return Scaffold(
      appBar: AppBar(title: Text('${state.selectedWorkout.name}'),),
      body: Text('Workout details ...'),
    );
  }
}
