import 'package:flutter/material.dart';
import 'package:budgie/SecondPage.dart';

void main() {
  runApp(MaterialApp(
    title: 'route',
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Budgie"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Go to second page"),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SecondScreen()));
          },
        ), // RaisedButton
      ),
    );
  }
}
