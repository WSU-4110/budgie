import 'package:budgie/cloud/cloud_fieldconstans.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BudgetView {
  final String name;
  final double cost;
  final DateTime date;

  BudgetView({
    required this.name,
    required this.cost,
    required this.date,
  });
  factory BudgetView.fromSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    final name = data[budgetviewFieldName] as String;
    final cost = data[budgetviewFieldCost] as double;
    final date = data[budgetviewFieldDate].toDate();

    return BudgetView(
      name: name,
      cost: cost,
      date: date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      budgetviewFieldName: name,
      budgetviewFieldCost: cost,
      budgetviewFieldDate: date,
    };
  }
}
