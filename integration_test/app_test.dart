import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('checking UI text', (tester) async {
      // Load app widget.
      await tester.pumpWidget(MyApp());

      // Verify the counter starts at 0.
      expect(find.text('Item 1'), findsWidgets);

      // Finds the floating action button to tap on.
      // final fab = find.byKey(const Key('increment'));

      // Emulate a tap on the floating action button.
      // await tester.tap(fab);

      // Trigger a frame.
      await tester.pumpAndSettle();

      // Verify the counter increments by 1.
      // expect(find.text('1'), findsOneWidget);
    });
  });
}
