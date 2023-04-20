import 'package:budgie/BudgetCategories/budgetCategoryPrice.dart';
import 'package:budgie/cloud/cloud_expense.dart';
import 'package:budgie/cloud/cloud_storage_exceptions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../mainPage.dart';
import 'cloud_field_constants.dart';

class GetExpenses {
  final user = FirebaseFirestore.instance
      .collection('users')
      .doc(Authenticator().currentUser?.uid);

  Future<num> getAllFieldValues(String fieldName) async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection(category).get();
    List<DocumentSnapshot> documentSnapshots = querySnapshot.docs;
    num sum = 0;
    for (var documentSnapshot in documentSnapshots) {
      num fieldValue = documentSnapshot.get('cost');
      sum += fieldValue;
    }
    return sum;
  }
}
