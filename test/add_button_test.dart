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
}
