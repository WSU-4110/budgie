import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "route",
      home: Scaffold(
        appBar: AppBar(
          title: Text("New Page"),
        ),
        body: Center(
          child: ElevatedButton(
            child: Text("Go Back"),
            onPressed: () {
              Navigator.pop(context);
            },
          ), // RaisedButton
        ),
      ),
    );
  }
}
