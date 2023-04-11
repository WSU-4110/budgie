import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:budgie/BudgetButton/SecondPage.dart';
import 'package:budgie/BudgetButton/button.dart';

void main() {
  testWidgets('Enter budget name test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: PageForName()));
    await tester.enterText(find.byType(TextField), 'My budget');
    expect(find.text('My budget'), findsOneWidget);
  });
  testWidgets('Navigate to PageForDate on button press test',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: PageForName()));
    await tester.tap(find.text('Next'));
    await tester.pumpAndSettle();
    expect(find.byType(PageForDate), findsOneWidget);
  });
}
