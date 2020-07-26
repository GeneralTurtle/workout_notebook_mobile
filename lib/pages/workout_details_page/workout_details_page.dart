import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_notebook_mobile/states/workout_details_state.dart';
import 'package:workout_notebook_mobile/states/workouts_state.dart';

class WorkoutDetailsPage extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<WorkoutDetailsState>(context);
    return WillPopScope(
      onWillPop: () => _onBackPressed(context, state),
      child: Scaffold(
        appBar: AppBar(
          title: _pageTitle(state),
          actions: _actions(state),
        ),
        body: Center(
          child: Text('${state.noExercisesDisplayMessage}'),
        ),
        floatingActionButton: _floatingActionButton(state),
      ),
    );
  }

  Widget _floatingActionButton(WorkoutDetailsState state) {
    return state.isEditing ? _addExerciseButton() : _noButton();
  }

  FloatingActionButton _addExerciseButton() {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {},
    );
  }

  SizedBox _noButton() => SizedBox.shrink();

  Widget _pageTitle(WorkoutDetailsState state) {
    return state.isEditing ? _editTitle(state) : _displayTitle(state);
  }

  Text _displayTitle(WorkoutDetailsState state) => Text('${state.pageTitle}');

  TextField _editTitle(WorkoutDetailsState state) {
    return TextField(
      controller: titleController,
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: state.pageTitle,
        hintStyle: TextStyle(color: Colors.white),
      ),
    );
  }

  List<Widget> _actions(WorkoutDetailsState state) {
    return state.isEditing
        ? _editingModeActions(state)
        : _notEditingModeActions(state);
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
        onPressed: () {
          state.stopEditWorkout(titleController.text);
        },
      ),
    ];
  }

  Future<bool> _onBackPressed(
      BuildContext context, WorkoutDetailsState state) async {
    final workoutsState = Provider.of<WorkoutsState>(context, listen: false);
    workoutsState.updateWorkout(state.workout);
    return true;
  }
}
