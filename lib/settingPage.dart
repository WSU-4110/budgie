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
                buildLogout(),
                buildDeleteAccount(),
              ],
            ),
          ],
        )));
  }
}

Widget buildLogout() => SimpleSettingsTile(
    title: 'Logout', subtitle: '', 
    leading: const Icon(Icons.logout),
    onTap:()=> signUserOut()
    );

Widget buildDeleteAccount() => SimpleSettingsTile(
    title: 'Delete Account', subtitle: '', leading: const Icon(Icons.delete),
    onTap: () async {
      FirebaseAuth.instance.currentUser?.delete();
        //await FirebaseAuth.instance.signOut();

}
    );

void signUserOut(){
  FirebaseAuth.instance.signOut();
}

