import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:workout_notebook_mobile/pages/workouts_page/workouts_page.dart';
import 'package:workout_notebook_mobile/provider_lib/providers.dart';
import 'package:workout_notebook_mobile/states/workouts_state.dart';

void main() {
  testWidgets('Find workouts page title', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Provider<WorkoutsState>(
        create: (ctx) => TestState(),
        child: WorkoutsPage(),
      ),
    ));

    final titleFinder = find.text(TestState.title);

    expect(titleFinder, findsOneWidget);
  });
}

class TestState implements WorkoutsState {
  static String title = 'Title';

  @override
  String get pageTitle => title;
}
