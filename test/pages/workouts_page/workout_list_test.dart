import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:workout_notebook_mobile/pages/workouts_page/workout_list.dart';
import 'package:workout_notebook_mobile/provider_lib/providers.dart';
import 'package:workout_notebook_mobile/states/workouts_state.dart';

import 'test_state.dart';

void main() {
  testWidgets('Empty workouts page', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Provider<WorkoutsState>(
        create: (ctx) => TestStateNoWorkout(),
        child: WorkoutList(),
      ),
    ));

    findOneText(TestState.noWorkoutsMessage);
  });

  testWidgets('With workouts page', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Provider<WorkoutsState>(
        create: (ctx) => TestStateWithWorkout(),
        child: WorkoutList(),
      ),
    ));

    findOneText('There are workouts');
  });
}

void findOneText(String textToFind) {
  final finder = find.text(textToFind);
  expect(finder, findsOneWidget);
}