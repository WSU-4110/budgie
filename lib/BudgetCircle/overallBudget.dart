import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

double totalBudget = 600;
double currentBudget = 150;

String currentBud = '$currentBudget';

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
  if (prog <= .33 ){ return Colors.red; }
  else if (prog <= .66) { return Colors.yellow; }
  else { return Colors.green; }
}