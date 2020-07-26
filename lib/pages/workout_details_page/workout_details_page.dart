import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_notebook_mobile/states/workout_details_state.dart';

class WorkoutDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<WorkoutDetailsState>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('${state.pageTitle}'),
      ),
      body: Center(child: Text('No exercises to display ...'),),
    );
  }
}
