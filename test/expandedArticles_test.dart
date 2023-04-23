import 'package:budgie/articlesPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Test if expandedArticle contains heading',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: ExpandedArticle()));

    // Testing for heading
    final heading = find.text('Getting Started');

    expect(heading, findsOneWidget);
  });

  testWidgets('Test if expandedArticle contains subheading',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: ExpandedArticle()));

    // Testing for subheading
    final subheading = find.text('Information');

    expect(subheading, findsOneWidget);
  });

  testWidgets('Test if expandedArticle contains sample text',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: ExpandedArticle()));

    // Testing for sample text
    final sampleText = find.text('Filler Text');

    expect(sampleText, findsOneWidget);
  });
}
