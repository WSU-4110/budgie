import 'package:budgie/BudgetCircle/overallBudget.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'overallBudget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _BudgetCircleState createState() => _BudgetCircleState();
}

class _BudgetCircleState extends State<HomePage> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularPercentIndicator(
          animation: true,
          animationDuration: 1000,
          radius: 100,
          lineWidth: 20,
          percent: ovProgress,
          center: new Text(currentBud + "/" + totalBud,
          style: 
          new TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0)
          ),
          progressColor: const Color.fromRGBO(211, 211, 211, 1),
          backgroundColor: colorChange(ovProgress),
          ),
        ),
      );
  }
}