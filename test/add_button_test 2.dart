import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:budgie/BudgetButton/SecondPage.dart';
import 'package:budgie/BudgetButton/button.dart';

void main() {
  testWidgets('Add new budget button test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: AddButton()));
    expect(find.text('Add New Budget'), findsOneWidget);
  });

  testWidgets('Navigate to PageForName on button press test',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: AddButton()));
    await tester.tap(find.text('Add New Budget'));
    await tester.pumpAndSettle();
    expect(find.byType(PageForName), findsOneWidget);
  });

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

  testWidgets('Enter budget cost test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: PageForCost()));
    await tester.enterText(find.byType(TextField), '100');
    expect(find.text('100'), findsOneWidget);
  });
}
