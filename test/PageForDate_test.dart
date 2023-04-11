import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:budgie/BudgetButton/SecondPage.dart';
import 'package:budgie/BudgetButton/button.dart';

void main() {
  testWidgets('Enter budget date test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: PageForDate()));
    await tester.enterText(find.byType(TextField), '2023-04-10');
    expect(find.text('2023-04-10'), findsOneWidget);
  });
  testWidgets('Navigate to PageForCost on button press test',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: PageForDate()));
    await tester.tap(find.text('Next'));
    await tester.pumpAndSettle();
    expect(find.byType(PageForCost), findsOneWidget);
  });
}
