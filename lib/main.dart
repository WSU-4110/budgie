import 'package:budgie/BudgetButton/button.dart';
import 'package:budgie/cloud/authpage.dart';
import 'package:flutter/material.dart';
import 'BudgetCategories/horProgressBar.dart';
import 'BudgetCircle/overallBudgetCircle.dart';
import 'articlesPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'settingPage.dart';
import 'themeUtil/theme_provider.dart';
import 'package:provider/provider.dart';
import 'cloud/login_page.dart';
import 'package:budgie/BudgetCategories/expenseForm.dart';
import 'package:budgie/BudgetCategories/expensesFormPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      name: 'budgie', options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            title: 'Budgie',
            theme: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
            ),
            themeMode: themeProvider.thememode,
            darkTheme: ThemeData(brightness: Brightness.dark),
            home: const MyStatefulWidget(),
          );
        },
      );
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  List pages = [
    const Authpage(),
    const HomePage(),
    const ArticlesPage(),
    SettingsPage(),
        const ExpensesFormPage(),
    const ExpenseForm()
  ];

  int selectedPage = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //        elevation: 0,
      //   backgroundColor: Color.fromARGB(0, 0, 0, 0),
      //   centerTitle: false,
      //   title: const Text(
      //     'Budgie',
      //     style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      //   ),
      // ),
      body: pages.elementAt(selectedPage),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedPage,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.login),
            label: 'lgin',
          ),
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
        Size dimens = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(children: <Widget>[
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
              SizedBox(height: 30, child: Center(child: AddButton()))
            ])),
      ]),
    );
  }
}
