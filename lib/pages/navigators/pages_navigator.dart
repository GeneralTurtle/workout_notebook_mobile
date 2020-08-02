import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_notebook_mobile/models/records_factory/workout_record_factory.dart';
import 'package:workout_notebook_mobile/models/workouts/workout.dart';
import 'package:workout_notebook_mobile/pages/workout_details_page/workout_details_page.dart';
import 'package:workout_notebook_mobile/pages/workout_record_page/workout_record_page.dart';
import 'package:workout_notebook_mobile/states/workout_details_state.dart';
import 'package:workout_notebook_mobile/states/workout_record_state.dart';

class PagesNavigator {
  void toWorkoutDetails(BuildContext context, Workout workout) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider<WorkoutDetailsState>(
          create: (context) => WorkoutDetailsState(workout),
          child: WorkoutDetailsPage(),
        ),
      ),
    );
  }

  void toPlayWorkoutPage(BuildContext context, Workout workout) {
    final factory = WorkoutRecordFactory();
    final record = factory.emptyRecordFromWorkout(workout);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider<WorkoutRecordState>(
          create: (context) => WorkoutRecordState(record),
          child: WorkoutRecordPage(),
        ),
      ),
    );
  }
}
