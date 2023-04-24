import 'dart:developer';

import 'package:budgie/cloud/cloud_budget.dart';
import 'package:budgie/cloud/firestore_cloud_service.dart';
import 'package:flutter/material.dart';
import 'BudgetButton/button.dart';
import 'BudgetCategories/horProgressBar.dart';
import 'BudgetCircle/overallBudgetCircle.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
  //this is the homepage
}

class _HomePageState extends State<HomePage> {
  late final FirestoreCloudService _firestoreCloudService;

  @override
  void initState() {
    _firestoreCloudService = FirestoreCloudService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size dimens = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          Expanded(
              child: Container(
                  margin: const EdgeInsets.all(5.5),
                  child: const OverBudgie())),
          const Divider(
            height: 40,
            thickness: 5,
            indent: 0,
            endIndent: 0,
            color: Color.fromARGB(255, 222, 222, 222),
          ),
          Container(
            padding: const EdgeInsets.only(left: 16),
            child: const Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                "Breakdown",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder(
              stream: _firestoreCloudService.allBudgets(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                  case ConnectionState.active:
                    if (snapshot.hasData) {
                      // Get all expenses from the current firestore snapshot
                      // and cast it to an iterable of CloudExpense
                      final allBudgets = snapshot.data as Iterable<CloudBudget>;

                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: allBudgets.length,
                        itemBuilder: (context, index) {
                          final budget = allBudgets.elementAt(index);
                          log(budget.name);
                          log(budget.total.toString());
                          return HorProgressBar(
                            budgetName: budget.name,
                            budgetTotal: budget.total,
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
          const SizedBox(
              height: 30,
              child: Center(
                child: AddButton(),
              ))
        ],
      ),
    );
  }
}
