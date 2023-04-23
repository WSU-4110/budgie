import 'package:budgie/articlesPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Test if articlesPage contains subheading in buttons',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: ArticlesPage()));

    // Testing for subheading
    final textWidget1 = find.text('Information');

    expect(textWidget1, findsWidgets);
  });

  testWidgets('Test if articlesPage contains first article title/number',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: ArticlesPage()));

    // Testing for specific article
    final textWidget2 = find.text('Article #1');

    expect(textWidget2, findsOneWidget);
  });

  testWidgets('Test if articlesPage contains another article title/number',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: ArticlesPage()));

    // Testing for another specific article
    final textWidget3 = find.text('Article #5');

    expect(textWidget3, findsOneWidget);
  });
}
