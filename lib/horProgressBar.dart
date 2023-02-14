import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

String category = 'Food';
String progressAmt = '300';
String totalProgress = '500';

// Calculates LinearPercentIndicator.percent
double percentHelper(String dividend, String divisor) {
  // Some text here
  var intDividend = double.parse(dividend);
  var intDivisor = double.parse(divisor);

  return intDividend / intDivisor;
}

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
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(category,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 20))),
          ),
          LinearPercentIndicator(
            lineHeight: 20,
            percent: percentHelper(progressAmt, totalProgress),
            progressColor: const Color.fromRGBO(34, 197, 94, 1),
            backgroundColor: const Color.fromRGBO(211, 211, 211, 1),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text('\$$progressAmt',
                        style: const TextStyle(fontWeight: FontWeight.w800)),
                    Text(' of $totalProgress'),
                  ],
                )),
          )
        ],
      )),
    );
  }
}

// Text('\$$progressAmt of $totalProgress')),
