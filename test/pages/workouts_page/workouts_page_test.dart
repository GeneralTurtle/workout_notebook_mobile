import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:workout_notebook_mobile/pages/workouts_page/workouts_page.dart';
import 'package:workout_notebook_mobile/states/workouts_state.dart';

import 'test_state.dart';

void main() {
  testWidgets('Empty workouts page', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: ChangeNotifierProvider<WorkoutsState>(
        create: (ctx) => TestState(),
        child: WorkoutsPage(),
      ),
    ));

    findOneText(TestState.title);
    findOneText(TestState.noWorkoutsMessage);
  });

  testWidgets('Add new workout to page', (WidgetTester tester) async {
    final state = TestState();
    state.newWorkout();

    await tester.pumpWidget(MaterialApp(
      home: ChangeNotifierProvider<WorkoutsState>(
        create: (ctx) => state,
        child: WorkoutsPage(),
      ),
    ));

    findOneText('There are workouts');

  });
}

void findOneText(String textToFind) {
  final finder = find.text(textToFind);
  expect(finder, findsOneWidget);
}
