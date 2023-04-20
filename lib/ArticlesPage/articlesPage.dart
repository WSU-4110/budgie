import 'package:flutter/material.dart';
import 'getArticles.dart';

class ArticlesPage extends StatelessWidget {
  Future<List<Article>> list = getArticles();

  ArticlesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Articles')),
        body: FutureBuilder<List<Article>>(
          future: getArticles(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Article> articles = snapshot.data!;
              return GridView.builder(
                padding: const EdgeInsets.all(5),
                itemCount: articles.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemBuilder: (context, index) {
                  Article article = articles[index];
                  return Center(
                      child: Card(
                          child: Material(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(8.0),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8.0),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ExpandedArticle(
                                    title: article.title,
                                    category: article.category,
                                    text: article.text)));
                      },
                      child: Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0)),
                          child: Center(
                            child: ListView(
                              physics: const NeverScrollableScrollPhysics(),
                              padding: const EdgeInsets.all(20.0),
                              shrinkWrap: true,
                              children: [
                                Center(
                                    child: Text(article.title,
                                        style: const TextStyle(
                                            color: Colors.white)))
                              ],
                            ),
                          )),
                    ),
                  )));
                },
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return const CircularProgressIndicator();
            }
          },
        ));
  }
}

class ExpandedArticle extends StatelessWidget {
  final String title;
  final String category;
  final String text;

  const ExpandedArticle(
      {Key? key,
      required this.title,
      required this.category,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            toolbarHeight: 100,
            centerTitle: false,
            backgroundColor: Colors.green,
            title:
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                  style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white)),
                  Text('Category: $category',
                  style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white))
                ],
              )
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(text)
          ),
        ));
  }
}
