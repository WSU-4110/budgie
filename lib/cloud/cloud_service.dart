import 'package:budgie/cloud/cloud_budgetviews.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:budgie/cloud/cloud_fieldconstans.dart';
import 'package:budgie/cloud/cloud_exceptions.dart';

class FirestoreCloudService {
  final user = FirebaseFirestore.instance.collection('users').doc('test1');
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addExpense(
      {required String category,
      required String budgetName,
      required double budgetCost,
      required DateTime budgetDate}) async {
    try {
      await user.collection(category).add(BudgetView(
            name: budgetName,
            cost: budgetCost,
            date: budgetDate,
          ).toMap());
    } catch (e) {
      throw CouldNotCreateBudgetException();
    }
  }

  Future<void> addBudgetName({required String budgetName}) async {
    try {
      final docRef = _firestore.collection('users').doc();
      await docRef.set({'name': budgetName});
    } catch (e) {
      throw Exception('Error adding budget name: $e');
    }
  }

  Stream<Iterable<BudgetView>> allBudgetsViews({required String category}) {
    final allBudgets = user
        .collection(category)
        .snapshots()
        .map((event) => event.docs.map((doc) => BudgetView.fromSnapshot(doc)));

    return allBudgets;
  }

  Future<void> addBudgetDetails(
      {required String budgetName,
      required DateTime budgetDate,
      required double budgetCost}) async {
    try {
      final docRef = _firestore.collection('users').doc();
      await docRef.set({
        'name': budgetName,
        'date': Timestamp.fromDate(budgetDate),
        'cost': budgetCost,
      });
    } catch (e) {
      throw Exception('Error adding budget details: $e');
    }
  }

  FirestoreCloudService._globalInstance();

  static final FirestoreCloudService _global =
      FirestoreCloudService._globalInstance();

  factory FirestoreCloudService() => _global;
}
