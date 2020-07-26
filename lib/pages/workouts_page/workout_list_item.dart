import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_notebook_mobile/models/workout.dart';
import 'package:workout_notebook_mobile/pages/navigators/pages_navigator.dart';
import 'package:workout_notebook_mobile/states/workouts_state.dart';

class WorkoutListItem extends StatelessWidget {
  final Workout workout;

  const WorkoutListItem({Key key, this.workout}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<WorkoutsState>(context, listen: false);

    return GestureDetector(
      onTap: () => _onTap(context, state),
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _workoutCardInfo(workout),
            _deleteButton(state.deleteWorkout, workout)
          ],
        ),
      ),
    );
  }

  void _onTap(BuildContext context, WorkoutsState state) {
    final navigator = Provider.of<PagesNavigator>(context, listen: false);
    state.selectWorkout(workout.uuid);
    navigator.toWorkoutDetails(context);
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