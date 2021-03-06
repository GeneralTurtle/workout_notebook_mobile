import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_notebook_mobile/models/workouts/exercise.dart';
import 'package:workout_notebook_mobile/pages/navigators/pages_navigator.dart';
import 'package:workout_notebook_mobile/pages/workout_details_page/add_exercise_sheet.dart';
import 'package:workout_notebook_mobile/pages/workout_details_page/exercise_list.dart';
import 'package:workout_notebook_mobile/pages/workout_details_page/workout_floating_button.dart';
import 'package:workout_notebook_mobile/states/exercise_details_state.dart';
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
          actions: _actions(state, context),
        ),
        body: ExerciseList(
          showBottomSheet: _showUpdateExerciseBottomSheet,
        ),
        floatingActionButton: WorkoutFloatingButton(_showUpdateExerciseBottomSheet),
      ),
    );
  }

  void _showUpdateExerciseBottomSheet(
    BuildContext ctx,
    WorkoutDetailsState state,
    Exercise exercise,
  ) {
    showModalBottomSheet(
      context: ctx,
      builder: (context) => MultiProvider(
        providers: [
          ChangeNotifierProvider<WorkoutDetailsState>.value(
            value: state,
          ),
          ChangeNotifierProvider<ExerciseDetailsState>(
            create: (context) => ExerciseDetailsState(exercise),
          ),
        ],
        child: AddExerciseSheet(),
      ),
    );
  }

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

  List<Widget> _actions(WorkoutDetailsState state, BuildContext context) {
    return state.isEditing
        ? _editingModeActions(state)
        : _notEditingModeActions(state, context);
  }

  List<Widget> _notEditingModeActions(WorkoutDetailsState state, BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.mode_edit),
        onPressed: state.editWorkout,
      ),
      IconButton(
        icon: Icon(Icons.folder),
        onPressed: (){
          final navigator = Provider.of<PagesNavigator>(context, listen: false);
          navigator.toWorkoutRecordListPage(context, state.workout);
        },
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
    BuildContext context,
    WorkoutDetailsState state,
  ) async {
    final workoutsState = Provider.of<WorkoutsState>(context, listen: false);
    workoutsState.updateWorkout(state.workout);
    return true;
  }
}
