import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'expenseForm.dart';

class ExpensesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "route",
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Test Expense name here"),
        ),
        body: Center(
          child: expenseForm()
          /*child: ElevatedButton(
              child: Text("Back to Home!"),
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.green)
                  ),*/ // RaisedButton
        ),
      ),
    );
  }
}
