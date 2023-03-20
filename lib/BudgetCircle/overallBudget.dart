import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

double totalBudget = 600;
double currentBudget = 90;

String currentBudgie = '$currentBudget';

ovProgress(double totalBud, double currentBud) {
  double progress = 0;
  
  if (totalBud <= 0) {
    return progress;
  }

  else{
    progress = (currentBud / totalBud);
    return progress;
  }
}

Color colorChange(double prog) {
  if (prog <= .15 ){ return Colors.red; }
  else if (prog <= .50) { return Colors.yellow; }
  else { return const Color.fromRGBO(34, 197, 94, 1);}
}