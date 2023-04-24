import 'package:budgie/BudgetButton/budget_form.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:budgie/BudgetButton/SecondPage.dart';
import 'package:budgie/BudgetButton/button.dart';

void main() {
  testWidgets('AddButton displays elevated button test',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: AddButton()));
    expect(
        find.widgetWithText(ElevatedButton, 'Add New Budget'), findsOneWidget);
  });

  testWidgets('Add New Budget button is displayed test',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: AddButton()));
    expect(find.text('Add New Budget'), findsOneWidget);
  });

  testWidgets('AddButton is rendered test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: AddButton()));
    expect(find.byType(AddButton), findsOneWidget);
  });

  testWidgets('AddButton displays "Add New Budget" text test',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: AddButton()));
    expect(find.text('Add New Budget'), findsOneWidget);
  });

  testWidgets('AddButton has elevated button widget tests',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: AddButton()));
    expect(find.byType(ElevatedButton), findsOneWidget);
  });

  testWidgets('AddButton has Scaffold widget test',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: AddButton()));
    expect(find.byType(Scaffold), findsOneWidget);
  });
}
