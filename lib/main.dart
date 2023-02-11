import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
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
  final pages=[
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
  Widget build(BuildContext context)
  
   {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Budgie'),
      ),
      body: pages.elementAt(selectedPage),
      bottomNavigationBar: BottomNavigationBar(
        type:BottomNavigationBarType.fixed,
        currentIndex:selectedPage,
        items:  <BottomNavigationBarItem>[
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
        onTap:(int index){
          setState(() {
            _onItemTapped(index);
          });
        },
      ),
    );
}
}


class HomePage extends StatelessWidget{ //this is the homepage
  @override
  Widget build(BuildContext context) {
return Column(
  children:[Text('This is a homepage')
  ]
);
  }
}

class TipsPage extends StatelessWidget{ //this is the tips page
  @override
  Widget build(BuildContext context) {

    return Center(
  child:Text('This is a tips page')
);
    
      
  }
}

class SettingsPage extends StatelessWidget{ //this is the settings page
  @override 
  Widget build(BuildContext context) {

    return Scaffold( 
appBar: AppBar(
  title: Text("Settings"),
),

      body:Center(
  child:Text('This is a settings page')
)
);
  }
}




