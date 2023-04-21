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
          budgetName: budgetNameController.text.trim(),
          budgetCost: budgetCost,
          budgetDate: DateTime.now());
    } catch (e) {
      print('Could not save budget name: $e');
    }
  }
import 'package:budgie/cloud/firestore_cloud_service.dart';
import 'budget_form.dart';

class PageForName extends StatelessWidget {
  const PageForName({super.key});

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
        title: const Text("Add a Budget"),
      ),
      body: const Center(child: BudgetForm()),
    );
  }
}
