import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier{
  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;

  void setThemeMode(ThemeMode mode){
    _themeMode = mode;
    notifyListeners();
  }

  void toggleTheme(){
    if(_themeMode == ThemeMode.light){
      setThemeMode(ThemeMode.dark);
    }else if(_themeMode == ThemeMode.dark){
      setThemeMode(ThemeMode.light);
    }else{
      setThemeMode(ThemeMode.system);
    }
  }
}