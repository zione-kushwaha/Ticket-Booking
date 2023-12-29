import 'package:flutter/material.dart';
class ThemeProvider extends ChangeNotifier {
  ThemeData _currentTheme = _buildLightTheme();

  ThemeData get currentTheme => _currentTheme;

  void toggleTheme() {
    _currentTheme = _currentTheme == _buildLightTheme() ? _buildDarkTheme() : _buildLightTheme();
    notifyListeners();
  }
bool currenttheme(){
  if(_currentTheme==_buildDarkTheme()){
    return true;
  }else{
    return false;
  }
}
  static ThemeData _buildLightTheme() {
    return ThemeData(
      brightness: Brightness.light,
    );
  }

  static ThemeData _buildDarkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
    );
  }
}