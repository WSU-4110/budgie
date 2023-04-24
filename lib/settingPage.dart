import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

import 'themeUtil/change_theme_button_widget.dart';

class SettingsPage extends StatelessWidget {
  bool isSwitched = false;

  SettingsPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Dark Mode"), actions: [
          ChangeThemeButtonWidget(),
        ]),
        body: SafeArea(
            child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            SettingsGroup(
              title: 'Account Settings',
              children: <Widget>[
                buildLogout(context),
                buildDeleteAccount(context),
              ],
            ),
          ],
        )));
  }
}

Widget buildLogout(BuildContext context) => SimpleSettingsTile(
    title: 'Logout', subtitle: '', leading: const Icon(Icons.logout),
    onTap: () async { showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Logout"),
            content: const Text("Are you sure you want to logout?"),
            actions: <Widget>[
              TextButton(
                child: const Text("Cancel"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text("Yes"),
                onPressed:  () async {
                  
                  signUserOut();
                  Navigator.of(context).pop();}
            
              ),
            ],
          );
        },
      );
    }
);


Widget buildDeleteAccount(BuildContext context) => SimpleSettingsTile(
    title: 'Delete Account', subtitle: '', leading: const Icon(Icons.delete),
    onTap: () async { showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Delete Account"),
            content: const Text("Are you sure you want to delete your account?"),
            actions: <Widget>[
              TextButton(
                child: const Text("Cancel"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text("Delete"),
                onPressed:  () async {
                  
                  FirebaseAuth.instance.currentUser?.delete();
                  Navigator.of(context).pop();}
            
              ),
            ],
          );
        },
      );
    }
);

void signUserOut(){
  FirebaseAuth.instance.signOut();
}

