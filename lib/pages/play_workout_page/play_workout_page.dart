import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_notebook_mobile/states/workout_details_state.dart';

class PlayWorkoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<WorkoutDetailsState>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Play: ${state.pageTitle}'),
      ),
      body: Center(
        child: Text('Play workout...'),
      ),
    );
  }
}
