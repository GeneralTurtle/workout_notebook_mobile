import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:workout_notebook_mobile/pages/workouts_page/workouts_page.dart';
import 'package:workout_notebook_mobile/provider_lib/providers.dart';
import 'package:workout_notebook_mobile/states/workouts_state.dart';

void main() {
  testWidgets('Empty workouts page', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Provider<WorkoutsState>(
        create: (ctx) => TestState(),
        child: WorkoutsPage(),
      ),
    ));

    findOneText(TestState.title);
    findOneText(TestState.noWorkoutsMessage);
  });
}

void findOneText(String textToFind) {
  final finder = find.text(textToFind);
  expect(finder, findsOneWidget);
}


class TestState implements WorkoutsState {
  static String title = 'Title';
  static String noWorkoutsMessage = 'nothing';

  @override
  String get pageTitle => title;

  @override
  String get noWorkoutsDisplayMessage => noWorkoutsMessage;
}
