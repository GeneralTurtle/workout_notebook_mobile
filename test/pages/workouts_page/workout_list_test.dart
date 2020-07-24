import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:workout_notebook_mobile/pages/workouts_page/workout_list.dart';
import 'package:workout_notebook_mobile/states/workouts_state.dart';

void main() {
  testWidgets('Empty workouts page', (WidgetTester tester) async {
    final state = WorkoutsState();
    await tester.pumpWidget(MaterialApp(
      home: ChangeNotifierProvider<WorkoutsState>(
        create: (ctx) => state,
        child: WorkoutList(),
      ),
    ));

    findOneText(state.noWorkoutsDisplayMessage);
  });

  testWidgets('With workouts page', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: ChangeNotifierProvider<WorkoutsState>(
        create: (ctx) => _createNotEmptyState(),
        child: WorkoutList(),
      ),
    ));

    findOneText('New workout');
  });
}

WorkoutsState _createNotEmptyState() {
  final testState = WorkoutsState();
  testState.newWorkout();
  return testState;
}

void findOneText(String textToFind) {
  final finder = find.text(textToFind);
  expect(finder, findsOneWidget);
}
