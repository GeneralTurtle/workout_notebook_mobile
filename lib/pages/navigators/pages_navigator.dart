import 'package:flutter/material.dart';
import 'package:workout_notebook_mobile/pages/workout_details_page/workout_details_page.dart';

class PagesNavigator {

  void toWorkoutDetails(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => WorkoutDetailsPage()));
  }

}