import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'expenseForm.dart';

class ExpensesFormPage extends StatelessWidget {
  const ExpensesFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.green,
        title: const Text("Test Expense name here"),
      ),
      body: const Center(child: ExpenseForm()
          /*child: ElevatedButton(
              child: Text("Back to Home!"),
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.green)
                  ),*/ // RaisedButton
          ),
    );
  }
}
