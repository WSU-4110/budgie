import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:budgie/ExpensesPage/expensesPageClass.dart';


class ExpensesContainer extends StatefulWidget {
  const ExpensesContainer({Key? key}) : super(key: key);

  @override
  _ExpensesContainer createState() => _ExpensesContainer();
}

class _ExpensesContainer extends State<ExpensesContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(expenseName,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              Text(
                expenseDate,
                style: const TextStyle(color: Colors.black87),
              )
            ]),
            Text('-\$$expensePrice',
                style: const TextStyle(color: Colors.red, fontSize: 16))
          ],
        ),
    );
  }
}
