// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:placeholder_api/main.dart';

void main() {

    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('Make Request Button', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('Make request'), findsOneWidget);
  });

    testWidgets('Make public api request', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byKey(const Key('apiUrlTextBox')));
    await tester.enterText(find.byKey(const Key('apiUrlTextBox')), 'https://jsonplaceholder.typicode.com/todos/1');
    await tester.tap(find.byKey(const Key('submitButton')));
    await tester.pump(const Duration(milliseconds: 1000));

    // Verify that our counter has incremented.
    expect(find.text("200"), findsOneWidget);
  });


    testWidgets('Make empty api request', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byKey(const Key('apiUrlTextBox')));
    await tester.enterText(find.byKey(const Key('apiUrlTextBox')), '');
    await tester.tap(find.byKey(const Key('submitButton')));
    await tester.pump(const Duration(milliseconds: 1000));

    // Verify that our counter has incremented.
    expect(find.text("400"), findsOneWidget);
  });

  
}
