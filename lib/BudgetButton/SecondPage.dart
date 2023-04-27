import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:budgie/cloud/firestore_cloud_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'budget_form.dart';

class PageForName extends StatelessWidget {
  const PageForName({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.green,
        title: const Text("Add a Budget"),
      ),
      body: const Center(child: BudgetForm()),
    );
  }
}
