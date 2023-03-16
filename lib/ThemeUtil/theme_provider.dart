import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeMode thememode=ThemeMode.system;

  bool get isDarkMode {
    if (thememode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return thememode == ThemeMode.dark;
    }
  }

  void toggleTheme(bool isOn) {
    thememode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}


class MyThemes{
  static final darkTheme=ThemeData();

  static final lightTheme=ThemeData();
}