import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:budgie/BudgetCategories/budgetCategoryPrice.dart';
import 'package:budgie/ExpensesPage/expensesPage.dart';

void main() {
  testWidgets('Progress Amount text is displayed', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text('\$$progressAmt',
                    style: const TextStyle(
                        fontWeight: FontWeight.w800, fontSize: 24)),
                Text(' of $totalProgress',
                    style: const TextStyle(fontSize: 16)),
              ],
            ),
        ),
      ),
    );

    // Find the Text widget
    final textWidget = find.text('\$$progressAmt');

    // Expect the Text widget to be found and displayed
    expect(textWidget, findsOneWidget);
  });

  testWidgets('Total progress text is displayed', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text('\$$progressAmt',
                    style: const TextStyle(
                        fontWeight: FontWeight.w800, fontSize: 24)),
                Text(' of $totalProgress',
                    style: const TextStyle(fontSize: 16)), 
                
              ],
            ),
        ),
      ),
    );

    // Find the Text widget
    final textWidget = find.text(' of $totalProgress');

    // Expect the Text widget to be found and displayed
    expect(textWidget, findsOneWidget);
  });

  
}
