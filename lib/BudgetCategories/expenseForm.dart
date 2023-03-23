import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:budgie/cloud/firestore_cloud_service.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key});

  @override
  State<ExpenseForm> createState() => ExpenseFormState();
}

class ExpenseFormState extends State<ExpenseForm> {
  final _formKey = GlobalKey<FormState>();
  bool isANumber = true;
  RegExp digitValidator = RegExp("[0-9]+");

  late final FirestoreCloudService _firestoreCloudService;
  late final TextEditingController expenseName;
  late final TextEditingController expenseCost;
  late final TextEditingController expenseDate;
  late final DateTime expenseDateValue;

  @override
  void initState() {
    _firestoreCloudService = FirestoreCloudService();
    expenseName = TextEditingController();
    expenseCost = TextEditingController();
    expenseDate = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    expenseName.dispose();
    expenseCost.dispose();
    expenseDate.dispose();
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
              icon: const Icon(Icons.assignment_outlined),
              hintText: 'Enter the Name of the Expense',
              labelText: 'Name',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            controller: expenseName,
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              icon: const Icon(Icons.attach_money_rounded),
              hintText: 'Enter the Cost',
              labelText: 'Cost',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid number';
              }
              return null;
            },
            controller: expenseCost,
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.calendar_today),
              hintText: 'Enter the date of the purchase',
              labelText: 'Select Date',
            ),
            onTap: () async {
              FocusScope.of(context).requestFocus(new FocusNode());

              DateTime? pickeddate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101));

              if (pickeddate != null) {
                setState(() {
                  expenseDate.text = DateFormat.yMMMMd().format(pickeddate);
                  expenseDateValue = pickeddate;
                });
              }
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter valid date';
              }
              return null;
            },
            controller: expenseDate,
          ),
          new Container(
            padding: const EdgeInsets.only(left: 150.0, top: 40.0),
            child: new ElevatedButton(
              child: const Text('Submit'),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );

                  await _firestoreCloudService.addExpense(
                    category: 'Food',
                    expenseName: expenseName.text,
                    expenseCost: double.parse(expenseCost.text),
                    expenseDate: expenseDateValue,
                  );
                }

                /*showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                          content: Text(expenseName.text +
                              expenseCost.text +
                              expenseDate.text));*/
              },
            ),
          ),
        ],
      ),
    );
  }
}
