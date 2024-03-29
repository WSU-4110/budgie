import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

String category = 'Food';
String progressAmt = '400';
String totalProgress = '500';

// Calculates LinearPercentIndicator.percent
double percentHelper(String dividend, String divisor) {
  // Some text here
  var intDividend = double.parse(dividend);
  var intDivisor = double.parse(divisor);

  return 1 - (intDividend / intDivisor);
}

Color dynamicColor(String dividend, String divisor) {
  var intDividend = double.parse(dividend);
  var intDivisor = double.parse(divisor);

  if ((intDividend / intDivisor) >= .75) {
    return Colors.green;
  } else if ((intDividend / intDivisor) >= .50) {
    return Colors.yellow;
  } else {
    return Colors.red;
  }
}
