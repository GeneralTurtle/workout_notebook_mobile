import 'package:flutter_test/flutter_test.dart';
import 'package:workout_notebook_mobile/main.dart';

void main() {
  testWidgets('Find workouts page title', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    final titleFinder = find.text('WORKOUTS');

    expect(titleFinder, findsOneWidget);
  });
}
