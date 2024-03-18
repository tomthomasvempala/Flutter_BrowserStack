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
    await tester.pumpWidget(const MyApp());
    await tester.tap(find.byKey(const Key('apiUrlTextBox')));
    await tester.enterText(find.byKey(const Key('apiUrlTextBox')), 'https://jsonplaceholder.typicode.com/todos/1');
    await tester.tap(find.byKey(const Key('submitButton')));
    await tester.pump(const Duration(milliseconds: 3000));
    
    expect(find.text("200"), findsOneWidget);
    expect(find.text('''{
  "userId": 1,
  "id": 1,
  "title": "delectus aut autem",
  "completed": false
}'''), findsOneWidget);

    await tester.pump(const Duration(milliseconds: 5000));
  });

      testWidgets('Make 10.0.2.2 api request', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.tap(find.byKey(const Key('apiUrlTextBox')));
    await tester.enterText(find.byKey(const Key('apiUrlTextBox')), 'http://10.0.2.2:3000');
    await tester.tap(find.byKey(const Key('submitButton')));
    await tester.pump(const Duration(milliseconds: 30000));
    
    expect(find.text("200"), findsOneWidget);
    expect(find.text("Hello"), findsOneWidget); 
  });
  

      testWidgets('Make localhost api request', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.tap(find.byKey(const Key('apiUrlTextBox')));
    await tester.enterText(find.byKey(const Key('apiUrlTextBox')), 'http://localhost:3000');
    await tester.tap(find.byKey(const Key('submitButton')));
    await tester.pump(const Duration(milliseconds: 30000));
    
    expect(find.text("200"), findsOneWidget);
    expect(find.text("Hello"), findsOneWidget); 
  });
  
}
