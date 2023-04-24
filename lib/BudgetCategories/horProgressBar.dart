import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:budgie/ExpensesPage/expenses_page.dart';
import 'package:budgie/BudgetCategories/budgetCategoryPrice.dart';

class HorProgressBar extends StatefulWidget {
  final String budgetName;
  final double budgetTotal;
  const HorProgressBar({
    Key? key,
    required this.budgetName,
    required this.budgetTotal,
  }) : super(key: key);

  @override
  _HorProgressBar createState() => _HorProgressBar();
}

class _HorProgressBar extends State<HorProgressBar> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ExpensesPage(budgetName: widget.budgetName)));
      },
      child: Container(
          margin: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(widget.budgetName,
                        style: const TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 20))),
              ),
              LinearPercentIndicator(
                animateFromLastPercent: true,
                lineHeight: 20,
                percent: percentHelper(progressAmt, totalProgress),
                progressColor: dynamicColor(progressAmt, totalProgress),
                backgroundColor: const Color.fromRGBO(211, 211, 211, 1),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text('\$$progressAmt',
                            style:
                                const TextStyle(fontWeight: FontWeight.w800)),
                        Text(' of ${widget.budgetTotal.toStringAsFixed(2)}'),
                      ],
                    )),
              )
            ],
          )),
    ));
  }
}
