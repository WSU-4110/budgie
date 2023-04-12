import 'package:flutter/material.dart';
import 'BudgetButton/button.dart';
import 'BudgetCategories/horProgressBar.dart';
import 'BudgetCircle/overallBudgetCircle.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  
  //this is the homepage
  @override
  Widget build(BuildContext context) {
        Size dimens = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(children: <Widget>[
        Expanded(
            child: Container(
                margin: const EdgeInsets.all(5.5), child: const OverBudgie())),
        const Divider(
          height: 40,
          thickness: 5,
          indent: 0,
          endIndent: 0,
          color: Color.fromARGB(255, 222, 222, 222),
        ),
        Container(
          padding: const EdgeInsets.only(left: 16),
          child: const Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              "Breakdown",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ),
        Expanded(
            child: ListView(
                children: const <Widget>[

              SizedBox(child: Center(child: HorProgressBar())),
              SizedBox(child: Center(child: HorProgressBar())),
              SizedBox(child: Center(child: HorProgressBar())),
              SizedBox(height: 30, child: Center(child: AddButton()))
            ])),
      ]),
    );
  }
}