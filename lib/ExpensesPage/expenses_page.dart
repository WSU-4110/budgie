import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:budgie/BudgetCategories/budgetCategoryPrice.dart';
import 'package:budgie/ExpensesPage/expenses_container.dart';

import '../BudgetCategories/expensesFormPage.dart';
import '../cloud/cloud_expense.dart';
import '../cloud/firestore_cloud_service.dart';

class ExpensesPage extends StatefulWidget {
  final String budgetName;
  const ExpensesPage({super.key, required this.budgetName});

  @override
  State<ExpensesPage> createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  late final FirestoreCloudService _firestoreCloudService;

  @override
  void initState() {
    _firestoreCloudService = FirestoreCloudService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      // Horizontal progress bar
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
                  style: const TextStyle(fontSize: 16, color: Colors.black87)),
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
          // List View
          Container(
            padding: const EdgeInsets.only(left: 10),
            child: const Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                'Expenses',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView(
                children: [
                  // ExpensesContainer(),
                  // ! This is where the expenses will be displayed
                  // ! StreamBuilder is used to get the data from the firestore
                  // ! and display it in the list view. The data is retrieved
                  // ! from the FirestoreCloudService class and the data is
                  // ! casted to an iterable of CloudExpense.
                  // ! The data is then displayed in the list view using the
                  // ! ExpensesContainer widget.
                  SizedBox(
                    height: 200,
                    child: StreamBuilder(
                      stream: _firestoreCloudService.allExpenses(
                          category: widget.budgetName),
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                          case ConnectionState.active:
                            if (snapshot.hasData) {
                              // Get all expenses from the current firestore snapshot
                              // and cast it to an iterable of CloudExpense
                              final allExpenses =
                                  snapshot.data as Iterable<CloudExpense>;

                              return ListView.builder(
                                itemCount: allExpenses.length,
                                itemBuilder: (context, index) {
                                  final expense = allExpenses.elementAt(index);
                                  log(expense.toString());
                                  return ExpensesContainer(
                                    expenseName: expense.name,
                                    expenseCost: expense.cost,
                                    expenseDate: expense.date,
                                  );
                                },
                              );
                            } else {
                              return const CircularProgressIndicator();
                            }
                          default:
                            return const CircularProgressIndicator();
                        }
                      },
                    ),
                  ),
                  // Container(
                  //   padding: const EdgeInsets.only(bottom: 10),
                  //   child: const Align(
                  //     alignment: AlignmentDirectional.centerStart,
                  //     child: Text(
                  //       'Over 30 Days',
                  //       style: TextStyle(
                  //           fontWeight: FontWeight.bold, fontSize: 24),
                  //     ),
                  //   ),
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: const [
                  //           Text('Kroger',
                  //               style: TextStyle(
                  //                   fontWeight: FontWeight.bold, fontSize: 18)),
                  //           Text(
                  //             '02/02/23',
                  //             style: TextStyle(color: Colors.black87),
                  //           )
                  //         ]),
                  //     const Text('-\$4.99',
                  //         style: TextStyle(color: Colors.red, fontSize: 16))
                  //   ],
                  // ),
                  // ! Add a new button to add a new expense for the category.
                  SizedBox(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ExpensesFormPage()));
                        // const ExpenseForm();
                      },
                      child: const Text(
                        'Add a new expense for Food',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
// RaisedButton
        ],
      ),
    );
  }
}
