import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:budgie/BudgetCategories/budgetCategoryPrice.dart';

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

  if (category == 'Food' &&
      (int.parse(progressAmt) / int.parse(totalProgress)) >= 0.75) {
    articles.sort((a, b) {
      if (a.category == 'Food' && b.category != 'Food') {
        return -1;
      } else if (a.category != 'Food' && b.category == 'Food') {
        return 1;
      } else {
        return a.category.compareTo(b.category);
      }
    });
  }

  return articles;
}

Future<Article> getFirstArticle() async {
  List<Article> articles = await getArticles();

  return articles[0];
}
