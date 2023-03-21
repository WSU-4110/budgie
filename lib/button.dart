import 'package:flutter/material.dart';
import 'package:budgie/SecondPage.dart';

void main() {
  runApp(MaterialApp(
    title: 'route',
    home: AddButton(),
  ));
}

class AddButton extends StatelessWidget {
  const AddButton({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text(
            "Add New Budget",
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PageForName()));
          },
          style: ElevatedButton.styleFrom(primary: Colors.green),
        ), // RaisedButton
      ),
    );
  }
}
