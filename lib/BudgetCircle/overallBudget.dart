import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

double totalBudget = 600;
double currentBudget = 150;

double ovProgress = 1 - (currentBudget / totalBudget);

String currentBud = '$currentBudget';
String totalBud = '$totalBudget';

Color colorChange(double progress) {
  if (progress >= .66 ){
    return Colors.red;
  }
  else if (progress >= .33) {
    return Colors.yellow;
  }
  else {
    return Colors.green;
  }
}