import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;

  ThemeProvider(){
    loadThemeMode();
  }

  void setThemeMode(ThemeMode mode){
    _themeMode = mode;
    saveThemeMode(mode);
    notifyListeners();
  }

  void loadThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final themeString = prefs.getString('themeMode')?? 'system';
    switch(themeString){
      case 'light':
        _themeMode = ThemeMode.light;
        break;

      case 'dark':
        _themeMode = ThemeMode.dark;
        break;

      default:
        _themeMode = ThemeMode.system;
    }
    notifyListeners();
  }

  void saveThemeMode(ThemeMode mode)async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('themeMode', mode.toString().split('.').last);
  }


}