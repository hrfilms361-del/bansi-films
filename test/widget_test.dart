import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bansi_films_frontend/main.dart';

void main() {
  testWidgets('Login button navigates to HomeScreen',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // Check LoginScreen is displayed
    expect(find.text('Login'), findsOneWidget);

    // Tap the Login button
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle(); // Wait for navigation

    // Check HomeScreen is displayed (or SearchScreen if navigation goes there)
    expect(find.text('Welcome to Bansi Films!'), findsOneWidget);
  });
}
