import 'package:budgie/cloud/cloud_storage_exceptions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'cloud_field_constants.dart';

class FirestoreCloudService {
  final user = FirebaseFirestore.instance.collection('users').doc('test');

  Future<void> addExpense(
      {required String category,
      required String expenseName,
      required double expenseCost,
      required DateTime expenseDate}) async {
    try {
      await user.collection(category).add({
        expenseFieldName: expenseName,
        expenseFieldCost: expenseCost,
        expenseFieldDate: expenseDate,
      });
    } catch (e) {
      throw CouldNotCreateExpenseException();
    }
  }

  FirestoreCloudService._globalInstance();

  static final FirestoreCloudService _global =
      FirestoreCloudService._globalInstance();

  factory FirestoreCloudService() => _global;
}
