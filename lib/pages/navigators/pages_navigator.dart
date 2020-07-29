import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'file:///C:/Dev/workout_notebook_mobile/lib/models/workouts/workout.dart';
import 'package:workout_notebook_mobile/pages/workout_details_page/workout_details_page.dart';
import 'package:workout_notebook_mobile/pages/workout_record_page/workout_record_page.dart';
import 'package:workout_notebook_mobile/states/workout_details_state.dart';

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
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider<WorkoutDetailsState>(
          create: (context) => WorkoutDetailsState(workout),
          child: WorkoutRecordPage(),
        ),
      ),
    );
  }
}
