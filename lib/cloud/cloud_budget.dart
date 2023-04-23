import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:budgie/cloud/cloud_field_constants.dart';

@immutable
class CloudBudget {
  final String documentId;
  final String name;
  final double total;

  const CloudBudget({
    required this.documentId,
    required this.name,
    required this.total,
  });

  CloudBudget.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : documentId = snapshot.id,
        name = snapshot.data()[budgetFieldName],
        total = double.parse(snapshot.data()[budgetFieldTotalCost].toString());
}
