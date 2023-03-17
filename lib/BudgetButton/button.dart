import 'package:flutter/material.dart';
import 'package:budgie/BudgetButton/SecondPage.dart';

void main() {
  runApp(MaterialApp(
    title: 'route',
    home: AddButton(),
  ));
}

class AddButton extends StatefulWidget {
  const AddButton({Key? key}) : super(key: key);

  @override
  _addButton createState() => _addButton();
}

class _addButton extends State<AddButton> {
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
                MaterialPageRoute(builder: (context) => PageForName()));
          },
          style: ElevatedButton.styleFrom(primary: Colors.green),
        ), // RaisedButton
      ),
    );
  }
}
