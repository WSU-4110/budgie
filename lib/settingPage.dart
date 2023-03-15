import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

import 'change_theme_button_widget.dart';



class SettingsPage extends StatelessWidget {
    bool isSwitched = false;

  SettingsPage({super.key});

  @override

  Widget build(BuildContext context) {

    return  Scaffold(
      body:SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            SettingsGroup(
              title:'Settings',
              children:
              <Widget>[
                

                buildLogout(),
                buildDeleteAccount(),darkmode(),
                  ChangeThemeButtonWidget(),
              ],
           ),
           
            
          ],
        )
      )

        );
  }
}

Widget buildLogout()=>SimpleSettingsTile(
  title:'Logout',
  subtitle: '',
  leading:const Icon(Icons.logout)

);

Widget buildDeleteAccount()=>SimpleSettingsTile(
  title:'Delete Account',
  subtitle: '',
  leading:const Icon(Icons.delete)

);

Widget darkmode()=>SimpleSettingsTile(
  title:'Dark Mode',
  subtitle: '',
  leading:const Icon(Icons.dark_mode),



);