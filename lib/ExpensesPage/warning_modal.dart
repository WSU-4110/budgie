import 'package:flutter/material.dart';
import 'package:budgie/BudgetCategories/budgetCategoryPrice.dart';

class WarningModal extends StatefulWidget {
  const WarningModal({super.key});

  @override
  State<WarningModal> createState() => _WarningModalState();
}

class _WarningModalState extends State<WarningModal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: (percentHelper(progressAmt, totalProgress) >= .75)
          ? new Container()
          : null,
    ));
  }
}
