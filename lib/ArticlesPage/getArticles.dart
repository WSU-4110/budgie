import 'package:cloud_firestore/cloud_firestore.dart';

class Article {
  final String title;
  final String category;
  final String text;

  Article({required this.title, required this.category, required this.text});

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
        title: map['title'], category: map['category'], text: map['text']);
  }
}

Future<List<Article>> getArticles() async {
  List<Article> articles = [];

  QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('Articles').get();

  querySnapshot.docs.forEach((doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    Article article = Article.fromMap(data);
    articles.add(article);
  });

  return articles;
}
