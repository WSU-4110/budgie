import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

double totalBudget = 600;
double currentBudget = 150;

double ovProgress = 1 - (currentBudget / totalBudget);

String currentBud = '$currentBudget';

Color colorChange(double progress) {
  if (progress >= .75 ){
    return Colors.red;
  }
  else if (progress >= .50) {
    return Colors.yellow;
  }
  else {
    return Colors.green;
  }
}