import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:budgie/cloud/cloud_field_constants.dart';

@immutable
class CloudBudget {
  final String documentId;
  final String name;
  final double cost;
  final String date;

  const CloudBudget({
    required this.documentId,
    required this.name,
    required this.cost,
    required this.date,
  });

  CloudBudget.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : documentId = snapshot.id,
        name = snapshot.data()[expenseFieldName],
        cost = double.parse(snapshot.data()[expenseFieldCost]),
        date = snapshot.data()[expenseFieldDate];
}
