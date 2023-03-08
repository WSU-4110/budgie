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
                    onTap: () {},
                    child: Container(
                      width: 200,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0)
                      ),
                      child: Center(
                        child: ListView(
                          padding: const EdgeInsets.all(20.0),
                          shrinkWrap: true,
                          children: [
                            Text(
                              'Article #${index+1}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                              )
                            ),
                            const Text(
                              'Information',
                              style: TextStyle(
                                color: Colors.white
                              )
                            )
                          ],
                        ),
                      )
                    ),
                  ),
                )
              ),
            );
          }),
        ),
      ),
    );
  }
}
