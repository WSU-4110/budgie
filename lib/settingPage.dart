import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';



class SettingsPage extends StatelessWidget {
    bool isSwitched = false;

  SettingsPage({super.key});

  @override

  Widget build(BuildContext context) {
    return Scaffold(
       
        body: SettingsList(
      sections: [
        SettingsSection(
          title: const Text('Settings'),
          tiles: <SettingsTile>[
            SettingsTile.switchTile(
              initialValue: isSwitched,
              onToggle: (value) {
                setState((){
                  isSwitched=value;
                });
              },

              leading: const Icon(Icons.format_paint),
              title: const Text('Use device theme'),
            ),
          ],
        
        ),
      ],
    ),
        );
  }
  
  void setState(Null Function() param0) {}
}