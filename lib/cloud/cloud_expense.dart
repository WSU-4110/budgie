import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:budgie/cloud/cloud_field_constants.dart';

@immutable
class CloudExpense {
  final String documentId;
  final String name;
  final double cost;
  final DateTime date;

  const CloudExpense({
    required this.documentId,
    required this.name,
    required this.cost,
    required this.date,
  });

  CloudExpense.fromSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : documentId = snapshot.id,
        name = snapshot.data()[expenseFieldName],
        cost = double.parse(snapshot.data()[expenseFieldCost]),
        date = snapshot.data()[expenseFieldDate];
}
