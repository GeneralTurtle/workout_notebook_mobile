import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:workout_notebook_mobile/pages/workouts_page/workouts_page.dart';
import 'package:workout_notebook_mobile/repositories/workout_repository.dart';
import 'package:workout_notebook_mobile/states/workouts_state.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final WorkoutRepository workoutRepository = WorkoutRepository();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<WorkoutsState>(
          create: (context) => WorkoutsState(workoutRepository),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            fontFamily: GoogleFonts.robotoMono().fontFamily),
        home: WorkoutsPage(),
      ),
    );
  }
}
