import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class HorProgressBar extends StatefulWidget {
  const HorProgressBar({Key? key}) : super(key: key);

  @override
  _HorProgressBar createState() => _HorProgressBar();
}

// Testing
const String thing1 = 'Test';
const String thing2 = '_Test';

class _HorProgressBar extends State<HorProgressBar> {
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Center(
                child: Column(
      children: [
        const Text('Food'),
        LinearPercentIndicator(
          lineHeight: 20,
          percent: .4,
          progressColor: const Color.fromRGBO(34, 197, 94, 1),
          backgroundColor: const Color.fromRGBO(211, 211, 211, 1),
        )
        const Text('300 0f 500'),
      ],
    ))));
  }
}
