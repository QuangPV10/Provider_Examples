import 'package:flutter/cupertino.dart';

class SettingProvider with ChangeNotifier {
  bool _isDark = false;

  get isDart => _isDark;

  set setValue(bool value) {
    _isDark = value;
    notifyListeners();
  }
}
