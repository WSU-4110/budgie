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
  if (prog <= .15 ){ return const Color.fromRGBO(225, 55, 43, 1); }
  else if (prog <= .50) { return const Color.fromRGBO(255, 217, 102, 1); }
  else { return const Color.fromRGBO(34, 197, 94, 1);}
}