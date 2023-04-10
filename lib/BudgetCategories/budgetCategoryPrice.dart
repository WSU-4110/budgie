import 'package:flutter/material.dart';


String category = 'Food';
String progressAmt = '400';
String totalProgress = '500';

// Calculates LinearPercentIndicator.percent
double percentHelper(String dividend, String divisor) {
  // Some text here
  var intDividend = double.parse(dividend);
  var intDivisor = double.parse(divisor);

  return intDividend / intDivisor;
}

Color dynamicColor(String dividend, String divisor) {
  var intDividend = double.parse(dividend);
  var intDivisor = double.parse(divisor);

  if ((intDividend / intDivisor) >= .75 ){
    return Colors.red;
  }
  else if ((intDividend / intDivisor) >= .50) {
    return Colors.yellow;
  }
  else {
    return Colors.green;
  }
}