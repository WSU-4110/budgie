import 'package:flutter/material.dart';

class ArticlesPage extends StatelessWidget {
  const ArticlesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GridView.count(
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 0,
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          children: List.generate(20, (index) {
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
                            builder: (context) => const ExpandedArticle()));
                  },
                  child: Container(
                      width: 200,
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Center(
                        child: ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.all(20.0),
                          shrinkWrap: true,
                          children: [
                            Text('Article #${index + 1}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            const Text('Information',
                                style: TextStyle(color: Colors.white))
                          ],
                        ),
                      )),
                ),
              )),
            );
          }),
        ),
      ),
    );
  }
}

class ExpandedArticle extends StatelessWidget {
  const ExpandedArticle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        centerTitle: false,
        backgroundColor: Colors.green,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text(
                'Getting Started',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                )
              ),
            ),
            Text(
              'Information',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white
              )
            )
          ],
        )
      ),
      body: const Padding(
        padding: EdgeInsets.all(30.0),
        child: Text(
          'Filler Text',
          style: TextStyle(
            fontSize: 16
          ),)
      )
    );
  }
}
