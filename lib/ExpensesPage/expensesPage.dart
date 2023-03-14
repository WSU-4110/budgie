import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:budgie/BudgetCategories/budgetCategoryPrice.dart';
import 'package:budgie/ExpensesPage/expensesContainer.dart';

class ExpensesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'route',
      home: Scaffold(
          extendBodyBehindAppBar: false,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Color.fromARGB(0, 0, 0, 0),
            centerTitle: false,
            title: const Text(
              'Food',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0)),
            ),
          ),
          body: Column(
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
                        style: const TextStyle(
                            fontSize: 16, color: Colors.black87)),
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
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: const Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      'Expenses',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                  ),
                ),
                Expanded(
                    child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: ListView(children: [
                          // ExpensesContainer(),
                           SizedBox(height: 50, child: Center(child: ExpensesContainer())),
                          const Divider(
                            height: 40,
                            thickness: 5,
                            indent: 0,
                            endIndent: 0,
                            color: Color.fromARGB(255, 222, 222, 222),
                          ),
                          Container(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: const Align(
                              alignment: AlignmentDirectional.centerStart,
                              child: Text(
                                'Over 30 Days',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 24),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text('Kroger',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18)),
                                    Text(
                                      '02/02/23',
                                      style: TextStyle(color: Colors.black87),
                                    )
                                  ]),
                              const Text('-\$4.99',
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 16))
                            ],
                          ),
                        ]))),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: const Text("Temporary Back Button"),
                ), // RaisedButton
              ])),
    );
  }
}
