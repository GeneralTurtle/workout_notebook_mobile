import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_notebook_mobile/models/workout.dart';
import 'package:workout_notebook_mobile/states/workouts_state.dart';

class WorkoutList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<WorkoutsState>(context);
    return _buildList(state);
  }

  Widget _buildList(WorkoutsState state) {
    return state.hasWorkouts
        ? _buildListOfWorkouts(state)
        : _buildNoWorkoutsView(state);
  }

  Widget _buildNoWorkoutsView(WorkoutsState state) {
    return Center(
      child: Text(state.noWorkoutsDisplayMessage),
    );
  }

  Widget _buildListOfWorkouts(WorkoutsState state) {
    return ListView.builder(
      itemCount: state.workouts.length,
      itemBuilder: (context, index) => _buildListItem(state.workouts[index], state.deleteWorkout),
    );
  }

  Widget _buildListItem(Workout workout, void Function(String uuid) deleteWorkout) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _workoutCardInfo(workout),
          _deleteButton(deleteWorkout, workout)
        ],
      ),
    );
  }

  Widget _deleteButton(void deleteWorkout(String uuid), Workout workout) {
    return IconButton(
          icon: Icon(Icons.delete),
          onPressed: () => deleteWorkout(workout.uuid),
        );
  }

  Widget _workoutCardInfo(Workout workout) {
    return Column(
          children: <Widget>[
            Text('${workout.name}'),
            Text('${workout.uuid}'),
          ],
        );
  }
}
