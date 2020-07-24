import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:workout_notebook_mobile/pages/workouts_page/workouts_page.dart';
import 'package:workout_notebook_mobile/states/workouts_state.dart';

void main() {
  testWidgets('Empty workouts page', (WidgetTester tester) async {
    final state = WorkoutsState();
    await tester.pumpWidget(MaterialApp(
      home: ChangeNotifierProvider<WorkoutsState>.value(
        value: state,
        child: WorkoutsPage(),
      ),
    ));

    findOneText(state.pageTitle);
    findOneText(state.noWorkoutsDisplayMessage);
  });

  testWidgets('Add new workout to page', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: ChangeNotifierProvider<WorkoutsState>(
        create: (ctx) => _createNotEmptyState(),
        child: WorkoutsPage(),
      ),
    ));

    findOneText('New workout');
  });
}

WorkoutsState _createNotEmptyState() {
  final state = WorkoutsState();
  state.newWorkout();
  return state;
}

void findOneText(String textToFind) {
  final finder = find.text(textToFind);
  expect(finder, findsOneWidget);
}
