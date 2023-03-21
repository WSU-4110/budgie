import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageForName extends StatelessWidget {
  final TextEditingController name_cOntrol = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Page_build(
      title: "Budget Name",
      child: TextField(
        controller: name_cOntrol,
        decoration: InputDecoration(
          labelText: "Add the budget Name",
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PageForDate(name_cOntrol.text)),
        );
      },
    );
  }
}

class PageForDate extends StatelessWidget {
  final String bud_name;
  final TextEditingController date_cOntrol = TextEditingController();
  PageForDate(this.bud_name, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page_build(
      title: "Budget Date",
      child: TextField(
        controller: date_cOntrol,
        decoration: InputDecoration(
          labelText: "Add the date of the Budget",
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PageForCost(bud_name, date_cOntrol.text),
          ),
        );
      },
    );
  }
}

class PageForCost extends StatelessWidget {
  final String budget_name;
  final String bud_date;
  final TextEditingController cost_cOntrol = TextEditingController();
  PageForCost(this.budget_name, this.bud_date, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page_build(
      title: "Budget Cost?",
      child: TextField(
        controller: cost_cOntrol,
        decoration: InputDecoration(
          labelText: "Add the cost of the budget",
        ),
      ),
      onPressed: () {
        Navigator.popUntil(context, ModalRoute.withName('/'));
      },
    );
  }
}

class Page_build extends StatelessWidget {
  final String title;
  final Widget child;
  final VoidCallback onPressed;

  const Page_build({
    required this.title,
    required this.child,
    required this.onPressed,
    Key? key,
  }) : super(key: key);
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            child,
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: onPressed,
              child: Text("Next"),
            ),
          ],
        ),
      ),
    );
  }
}
