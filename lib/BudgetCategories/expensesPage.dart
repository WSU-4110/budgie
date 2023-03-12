import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:budgie/BudgetCategories/budgetCategoryPrice.dart';

class ExpensesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "route",
      home: Scaffold(
          extendBodyBehindAppBar: false,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Color.fromARGB(0, 0, 0, 0),
            centerTitle: false,
            title: const Text(
              'Food',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0)),
            ),
          ),
          body: Container(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text('\$$progressAmt',
                        style: const TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 24)),
                    Text(' of $totalProgress',
                        style: const TextStyle(fontSize: 16)),
                  ],
                ),
                LinearPercentIndicator(
                  animateFromLastPercent: true,
                  lineHeight: 20,
                  percent: percentHelper(progressAmt, totalProgress),
                  progressColor: dynamicColor(progressAmt, totalProgress),
                  backgroundColor: const Color.fromRGBO(211, 211, 211, 1),
                ),
                const Divider(
                  height: 40,
                  thickness: 5,
                  indent: 0,
                  endIndent: 0,
                  color: Color.fromARGB(255, 222, 222, 222),
                ),
                ElevatedButton(
                    child: Text("Temporary Back Button"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green)), // RaisedButton
              ]))),
    );
  }
}
