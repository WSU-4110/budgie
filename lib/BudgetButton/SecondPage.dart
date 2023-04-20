import 'package:budgie/cloud/cloud_fieldconstans.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:budgie/cloud/cloud_service.dart';

class PageForName extends StatefulWidget {
  @override
  _PageForNameState createState() => _PageForNameState();
}

class _PageForNameState extends State<PageForName> {
  final TextEditingController budgetNameController = TextEditingController();
  double budgetCost = 0.0;

  Future<void> saveBudgetName(
      String budgetName, double budgetCost, DateTime budgetDate) async {
    final cloudService = FirestoreCloudService();
    try {
      await cloudService.addBudgetDetails(
          budgetName: budgetName,
          budgetCost: budgetCost,
          budgetDate: DateTime.now());
    } catch (e) {
      print('Could not save budget name: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Budget Name",
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: budgetNameController,
              decoration: InputDecoration(
                labelText: "Add the Budget Name",
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text("Next"),
              onPressed: () async {
                final budgetName = budgetNameController.text.trim();
                if (budgetName.isNotEmpty) {
                  final budgetDate = DateTime.now();
                  await saveBudgetName(budgetName, budgetCost, budgetDate);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => PageForDate(budgetName: budgetName)),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('Please enter a budget name.'),
                        actions: [
                          TextButton(
                            child: Text('OK'),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PageForDate extends StatefulWidget {
  final String budgetName;
  const PageForDate({Key? key, required this.budgetName}) : super(key: key);

  @override
  _PageForDateState createState() => _PageForDateState();
}

class _PageForDateState extends State<PageForDate> {
  final TextEditingController budgetDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Budget Date",
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: budgetDateController,
              decoration: InputDecoration(
                labelText: "Add the date of the Budget",
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text("Next"),
              onPressed: () {
                final budgetDate =
                    DateTime.parse(budgetDateController.text.trim());
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PageForCost(
                          budgetName: widget.budgetName,
                          budgetDate: budgetDate)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PageForCost extends StatefulWidget {
  final String budgetName;
  final DateTime budgetDate;
  const PageForCost(
      {Key? key, required this.budgetName, required this.budgetDate})
      : super(key: key);

  @override
  _PageForCostState createState() => _PageForCostState();
}

class _PageForCostState extends State<PageForCost> {
  final TextEditingController budgetCostController = TextEditingController();

  Future<void> saveBudgetStuff(
      String budgetName, DateTime budgetDate, double budgetCost) async {
    final cloudService = FirestoreCloudService();
    try {
      await cloudService.addBudgetDetails(
          budgetName: budgetName,
          budgetDate: budgetDate,
          budgetCost: budgetCost);
    } catch (e) {
      print('Could not save budget details: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    final String budgetName = args is PageForCost ? args.budgetName : '';
    final DateTime budgetDate =
        args is PageForCost ? args.budgetDate : DateTime.now();

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Budget Cost?",
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: budgetCostController,
              decoration: InputDecoration(
                labelText: "Add the cost of the budget",
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text("Done"),
              onPressed: () async {
                final budgetCost =
                    double.tryParse(budgetCostController.text.trim());
                if (budgetCost != null) {
                  await saveBudgetStuff(budgetName, budgetDate, budgetCost);
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('Please enter a budget cost.'),
                        actions: [
                          TextButton(
                            child: Text('OK'),
                            onPressed: () => Navigator.pop(context),
                          )
                        ],
                      );
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
