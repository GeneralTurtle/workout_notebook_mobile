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
        actions: _actions(state),
      ),
      body: Center(
        child: Text('${state.noExercisesDisplayMessage}'),
      ),
    );
  }

  List<Widget> _actions(WorkoutDetailsState state) {
    return state.isEditing ? _editingModeActions(state) : _notEditingModeActions(state);
  }

  List<Widget> _notEditingModeActions(WorkoutDetailsState state) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.mode_edit),
        onPressed: state.editWorkout,
      ),
    ];
  }

  List<Widget> _editingModeActions(WorkoutDetailsState state) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.check),
        onPressed: state.stopEditWorkout,
      ),
    ];
  }
}
