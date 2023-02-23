import 'package:flutter/material.dart';
import 'package:budgie/SecondPage.dart';

/* void main() {
  runApp(MaterialApp(
    title: 'route',
    home: _addButton(),
  ));
} */

class addButton extends StatefulWidget {
  const addButton({Key? key}) : super(key: key);

  @override
  _addButton createState() => _addButton();
}

class _addButton extends State<addButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(
        title: Text("Budgie"),
      ), */
      body: Center(
        child: ElevatedButton(
          child: Text(
            "Add New Budget",
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SecondScreen()));
          },
          style: ElevatedButton.styleFrom(primary: Colors.green),
        ), // RaisedButton
      ),
    );
  }
}
