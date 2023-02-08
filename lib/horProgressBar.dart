import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class HorProgressBar extends StatefulWidget {
  const HorProgressBar({Key? key}) : super(key: key);

  @override
  _HorProgressBar createState() => _HorProgressBar();
}

class _HorProgressBar extends State<HorProgressBar> {
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: LinearPercentIndicator(
        lineHeight: 20,
        percent: .4,
        leading: new Text(
            'Food'), // Will figure out how to put this as a header later
        progressColor: const Color.fromRGBO(34, 197, 94, 1),
        backgroundColor: const Color.fromRGBO(211, 211, 211, 1),
      ),
    ));
  }
}
