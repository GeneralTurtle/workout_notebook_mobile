import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:workout_notebook_mobile/pages/navigators/pages_navigator.dart';
import 'package:workout_notebook_mobile/pages/workouts_page/workouts_page.dart';
import 'package:workout_notebook_mobile/states/workouts_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => PagesNavigator(),
        ),
        ChangeNotifierProvider<WorkoutsState>(
          create: (context) => WorkoutsState(),
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
