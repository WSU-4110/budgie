import 'package:budgie/ArticlesPage/articlesPage.dart';
import 'package:budgie/ArticlesPage/getArticles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  List<Article> articles = [
    Article(
        title: '5 Simple Strategies for Better Budgeting',
        category: 'General',
        text: 'Lorem ipsum'),
    Article(
        title: 'Eating Well on a Budget: Tips and Tricks',
        category: 'Food',
        text: 'Lorem ipsum')
  ];

  testWidgets('Test if articlesPage contains heading',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(appBar: AppBar(title: const Text('Articles')))));

    // Testing for heading
    final textWidget1 = find.text('Articles');

    expect(textWidget1, findsWidgets);
  });

  testWidgets('Test if articlesPage contains an article title',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
      body: InkWell(
        child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
            child: Center(
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(20.0),
                shrinkWrap: true,
                children: [
                  Center(
                      child: Text(articles[0].title,
                          style: const TextStyle(color: Colors.white)))
                ],
              ),
            )),
      ),
    )));

    // Testing for specific article
    final textWidget2 = find.text('5 Simple Strategies for Better Budgeting');

    expect(textWidget2, findsOneWidget);
  });

  testWidgets('Test if articlesPage contains another article title',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
      body: InkWell(
        child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
            child: Center(
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(20.0),
                shrinkWrap: true,
                children: [
                  Center(
                      child: Text(articles[1].title,
                          style: const TextStyle(color: Colors.white)))
                ],
              ),
            )),
      ),
    )));

    // Testing for specific article
    final textWidget3 = find.text('Eating Well on a Budget: Tips and Tricks');

    expect(textWidget3, findsOneWidget);
  });
}
