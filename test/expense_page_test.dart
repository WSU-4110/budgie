import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:budgie/BudgetCategories/budgetCategoryPrice.dart';
import 'package:budgie/ExpensesPage/expensesPage.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

void main() {
  testWidgets('Progress Amount text is displayed', (WidgetTester tester) async {
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
              Text(' of $totalProgress', style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );

    final textWidget = find.text('\$$progressAmt');

    expect(textWidget, findsOneWidget);
  });

  testWidgets('Total progress text is displayed', (WidgetTester tester) async {
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
              Text(' of $totalProgress', style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );

    final textWidget = find.text(' of $totalProgress');

    expect(textWidget, findsOneWidget);
  });

  testWidgets('Ternary operator displays Icon widget when condition is true',
      (WidgetTester tester) async {
    bool condition = true;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: condition
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    const Icon(Icons.warning_amber_rounded, size: 30.0),
                    Text('\$$progressAmt',
                        style: const TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 24)),
                    Text(' of $totalProgress',
                        style: const TextStyle(fontSize: 16)),
                  ],
                )
              : Row(
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

    final iconWidget = find.byIcon(
      Icons.warning_amber_rounded,
    );

    expect(iconWidget, findsOneWidget);
  });

  testWidgets(
      'Ternary operator does not display Icon widget when condition is false',
      (WidgetTester tester) async {
    bool condition = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: condition
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    const Icon(Icons.warning_amber_rounded, size: 30.0),
                    Text('\$$progressAmt',
                        style: const TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 24)),
                    Text(' of $totalProgress',
                        style: const TextStyle(fontSize: 16)),
                  ],
                )
              : Row(
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

    final iconWidget = find.byIcon(
      Icons.warning_amber_rounded,
    );

    expect(iconWidget, findsNothing);
  });

  testWidgets('Expenses header text is displayed', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Container(
            padding: const EdgeInsets.only(left: 10),
            child: const Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                'Expenses',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
          ),
        ),
      ),
    );

    final textWidget = find.text('Expenses');

    expect(textWidget, findsOneWidget);
  });

  testWidgets('Expenses header text is displayed', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Container(
            padding: const EdgeInsets.only(left: 10),
            child: const Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                'Expenses',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
          ),
        ),
      ),
    );

    final textWidget = find.text('Expenses');

    expect(textWidget, findsOneWidget);
  });
}
