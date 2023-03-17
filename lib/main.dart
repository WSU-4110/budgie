import 'package:budgie/button.dart';
import 'package:flutter/material.dart';
import 'BudgetCategories/horProgressBar.dart';
import 'BudgetCircle/overallBudgetCircle.dart';
import 'package:budgie/articlesPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'budgie',
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Budgie',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final pages = [
    HomePage(),
    TipsPage(),
    SettingsPage(),
  ];

  var selectedPage = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Budgie',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: pages.elementAt(selectedPage),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedPage,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Tips',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        selectedItemColor: Colors.green[800],
        onTap: (int index) {
          setState(() {
            _onItemTapped(index);
          });
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  //this is the homepage
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: <Widget>[
        Expanded(
            child: Container(
                margin: const EdgeInsets.all(5.5), child: const OverBudgie())),
        const Divider(
          height: 40,
          thickness: 5,
          indent: 0,
          endIndent: 0,
          color: Color.fromARGB(255, 222, 222, 222),
        ),
        Container(
          padding: const EdgeInsets.only(left: 10),
          child: const Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              "Breakdown",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ),
        Expanded(
            child: ListView(
                padding: const EdgeInsets.all(5),
                children: const <Widget>[
              SizedBox(height: 118, child: Center(child: HorProgressBar())),
              SizedBox(height: 118, child: Center(child: HorProgressBar())),
              SizedBox(height: 118, child: Center(child: HorProgressBar())),
              SizedBox(height: 30, child: Center(child: addButton()))
            ])),
      ]),
    );
  }
}

class TipsPage extends StatelessWidget {
  //this is the tips page
  @override
  Widget build(BuildContext context) {
    return const Center(child: ArticlesPage());
  }
}

class SettingsPage extends StatelessWidget {
  //this is the settings page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
        ),
        body: Center(child: Text('This is a settings page')));
  }
}
