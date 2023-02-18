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
          center: new Text(percentage + "%",
          style: 
          new TextStyle(fontWeight: FontWeight.bold, fontSize: 50.0)
          ),
          progressColor: Colors.grey,
          backgroundColor: 
        ),
      ),
    );
  }
}