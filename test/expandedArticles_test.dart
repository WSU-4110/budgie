import 'package:budgie/ArticlesPage/articlesPage.dart';
import 'package:budgie/ArticlesPage/getArticles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Article mockArticle = Article(
    title: 'Eating Well on a Budget: Tips and Tricks',
    category: 'Food',
    text: 'Lorem ipsum');

  testWidgets('Test if expandedArticle contains title',
      (WidgetTester tester) async {

    await tester.pumpWidget(MaterialApp(
        home: ExpandedArticle(
          title: mockArticle.title,
          category: mockArticle.category,
          text: mockArticle.text)));

    // Testing for title
    final heading = find.text('Eating Well on a Budget: Tips and Tricks');

    expect(heading, findsOneWidget);
  });

  testWidgets('Test if expandedArticle contains category subheading',
      (WidgetTester tester) async {

    await tester.pumpWidget(MaterialApp(
        home: ExpandedArticle(
          title: mockArticle.title,
          category: mockArticle.category,
          text: mockArticle.text)));

    // Testing for category subheading
    final subheading = find.text('Category: Food');

    expect(subheading, findsOneWidget);
  });

  testWidgets('Test if expandedArticle contains sample text',
      (WidgetTester tester) async {
    
    await tester.pumpWidget(MaterialApp(
        home: ExpandedArticle(
          title: mockArticle.title,
          category: mockArticle.category,
          text: mockArticle.text)));

    // Testing for sample text
    final sampleText = find.text('Lorem ipsum');

    expect(sampleText, findsOneWidget);
  });
}
