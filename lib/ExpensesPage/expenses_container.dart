import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:budgie/ExpensesPage/expensesPageClass.dart';

class ExpensesContainer extends StatefulWidget {
  // final String expenseName;
  // final double expenseCost;
  // final DateTime expenseDate;
  const ExpensesContainer({Key? key
  // required this.expenseName,
  // required this.expenseCost,
  // required this.expenseDate
  }) : super(key: key);

  @override
  _ExpensesContainer createState() => _ExpensesContainer();
}

class _ExpensesContainer extends State<ExpensesContainer> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(expenseName,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          Text(
            expenseDate.toString(),
          )
        ]),
        Text('\$$num',
            style: const TextStyle(color: Colors.red, fontSize: 16))
      ],
    );
  }
}
