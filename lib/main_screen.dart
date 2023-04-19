import 'package:budgie/mainPage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:budgie/settingPage.dart';
import 'articlesPage.dart';
import 'home_Page.dart';


class MainScreen extends StatefulWidget {
   const MainScreen({Key? key}):super(key: key);
  
  @override
  State<MainScreen> createState() =>_MainScreenState();

}

class _MainScreenState extends State<MainScreen> {

  final User? user=Authenticator().currentUser;
   List pages = [
    const HomePage(),
    const ArticlesPage(),
    SettingsPage(),
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



