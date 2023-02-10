import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

String category = 'Food';
String progressAmt = '100';
String totalProgress = '500';

class HorProgressBar extends StatefulWidget {
  const HorProgressBar({Key? key}) : super(key: key);

  @override
  _HorProgressBar createState() => _HorProgressBar();
}

class _HorProgressBar extends State<HorProgressBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(category,
              textAlign: TextAlign.left,
              style:
                  const TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
          LinearPercentIndicator(
            lineHeight: 20,
            percent: percentHelper(progressAmt, totalProgress),
            progressColor: const Color.fromRGBO(34, 197, 94, 1),
            backgroundColor: const Color.fromRGBO(211, 211, 211, 1),
          ),
          Text('$progressAmt of $totalProgress', textAlign: TextAlign.left),
        ],
      )),
    );
  }
}

// Calculates LinearPercentIndicator.percent
double percentHelper(String dividend, String divisor) {
  // Some text here
  var intDividend = double.parse(dividend);
  var intDivisor = double.parse(divisor);

  return intDividend / intDivisor;
}
