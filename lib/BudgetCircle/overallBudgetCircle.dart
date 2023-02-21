import 'package:budgie/BudgetCircle/overallBudget.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'overallBudget.dart';

class OverBudgie extends StatefulWidget {
  const OverBudgie({Key? key}) : super(key: key);

  @override
  _BudgetCircleState createState() => _BudgetCircleState();
}

class _BudgetCircleState extends State<OverBudgie> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularPercentIndicator(
          animation: false,
          radius: 100,
          lineWidth: 20,
          percent: ovProgress,
          center: new Text("\$" + currentBud,
          style: 
          new TextStyle(fontWeight: FontWeight.bold, fontSize: 45.0)
          ),
          progressColor: const Color.fromRGBO(211, 211, 211, 1),
          backgroundColor: colorChange(ovProgress),
          ),
        ),
      );
  }
}