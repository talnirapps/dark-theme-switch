import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier with ChangeNotifier {
  ThemeMode? themeMode;

  ThemeNotifier() {
    _initTheme();
  }

  _initTheme() async {
    var prefs = await SharedPreferences.getInstance();
    var darkModeOn = prefs.getBool('darkMode');
    if (darkModeOn != null) {
      if (darkModeOn == true) {
        themeMode = ThemeMode.dark;
      } else {
        themeMode = ThemeMode.light;
      }
    }
    notifyListeners();
  }

  getTheme() {
    if (themeMode != null) {
      return themeMode;
    }
    if (SchedulerBinding.instance == null) {
      return ThemeMode.system;
    }
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    if (darkModeOn) {
      return ThemeMode.dark;
    } else {
      return ThemeMode.light;
    }
  }

  setTheme(ThemeMode themeMode) async {
    this.themeMode = themeMode;
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool('darkMode', themeMode == ThemeMode.dark);
    notifyListeners();
  }

  switchTheme() async {
    if (themeMode == ThemeMode.dark) {
      setTheme(ThemeMode.light);
    } else {
      setTheme(ThemeMode.dark);
    }
  }
}
