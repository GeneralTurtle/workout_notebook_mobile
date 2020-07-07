import 'package:flutter_test/flutter_test.dart';
import 'package:workout_notebook_mobile/main.dart';

void main() {
  testWidgets('Empty test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    final titleFinder = find.text('No days workouts to display...');

    expect(titleFinder, findsOneWidget);
  });
}