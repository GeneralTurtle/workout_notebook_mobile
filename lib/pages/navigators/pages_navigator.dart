import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_notebook_mobile/models/workout.dart';
import 'package:workout_notebook_mobile/pages/play_workout_page/play_workout_page.dart';
import 'package:workout_notebook_mobile/pages/workout_details_page/workout_details_page.dart';
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
        builder: (context) => PlayWorkoutPage(),
      ),
    );
  }
}
