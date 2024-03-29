import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:flutter_test/flutter_test.dart';

ovProgress(double totalBud, double currentBud) {
  double progress = 0;

  if (totalBud <= 0) {
    return progress;
  } else {
    progress = (currentBud / totalBud);
    return progress;
  }
}

Color colorChange(double prog) {
  if (prog <= .15) {
    return const Color.fromRGBO(225, 55, 43, 1);
  } else if (prog <= .50) {
    return const Color.fromRGBO(255, 217, 102, 1);
  } else {
    return const Color.fromRGBO(34, 197, 94, 1);
  }
}

class OverBudgie extends StatefulWidget {
  const OverBudgie({Key? key}) : super(key: key);

  @override
  _BudgetCircleState createState() => _BudgetCircleState();
}

class _BudgetCircleState extends State<OverBudgie> {
  double totalBudget = 600;
  double currentBudget = 90;

  late String currentBudgie = '$currentBudget';
  late String totalBudgie = '$totalBudget';

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularPercentIndicator(
          animation: false,
          radius: 100,
          lineWidth: 20,
          percent: ovProgress(totalBudget, currentBudget),
          center: new Text("\$" + currentBudgie,
              style:
                  new TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0)),
          footer: Text("out of " + totalBudgie,
              style:
                  new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
          circularStrokeCap: CircularStrokeCap.round,
          backgroundColor: const Color.fromRGBO(211, 211, 211, 1),
          progressColor: colorChange(ovProgress(totalBudget, currentBudget)),
        ),
      ),
    );
  }
}
