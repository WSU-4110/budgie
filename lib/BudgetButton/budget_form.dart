import 'package:budgie/BudgetButton/SecondPage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:budgie/cloud/firestore_cloud_service.dart';

class BudgetForm extends StatefulWidget {
  const BudgetForm({super.key});

  @override
  State<BudgetForm> createState() => BudgetFormState();
}

class BudgetFormState extends State<BudgetForm> {
  final _formKey = GlobalKey<FormState>();
  bool isANumber = true;

  late final FirestoreCloudService _firestoreCloudService;
  late final TextEditingController nameBudget;
  late final TextEditingController costTotal;

  @override
  void initState() {
    _firestoreCloudService = FirestoreCloudService();
    nameBudget = TextEditingController();
    costTotal = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameBudget.dispose();
    costTotal.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                    hintText: 'Enter the Name of the Budget',
                    labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                controller: nameBudget,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    hintText: 'Enter the Amount of the Budget',
                    labelText: 'Total Budget'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                controller: costTotal,
              ),
              Container(
                  padding: const EdgeInsets.only(left: 150.0, top: 40.0),
                  child: ElevatedButton(
                      child: const Text('Submit'),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );

                          await _firestoreCloudService.addBudget(
                              budgetName: nameBudget.text,
                              totalCost: double.parse(costTotal.text));
                        }

                        Navigator.popUntil(context, ModalRoute.withName('/'));
                      }))
            ]));
  }
}
