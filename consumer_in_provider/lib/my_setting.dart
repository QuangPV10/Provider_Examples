import 'dart:math';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class MySetting with ChangeNotifier {
  final _words = nouns.take(50);
  final _colors = [Colors.red, Colors.blue, Colors.orange.shade700, Colors.green, Colors.purple, Colors.yellow];
  double _fontSize = 0.5;
  String text = 'PHẠM VĂN QUANG';
  Color color = Colors.black;

  get getFontSize => _fontSize * 50;

  get getSliderFontSize => _fontSize;

  set setFontSize(double value) {
    _fontSize = value;
    notifyListeners();
  }

  void changeText() {
    var index = Random().nextInt(_words.length);
    text = _words.elementAt(index);
    notifyListeners();
  }

  void changeColor() {
    var index = Random().nextInt(_colors.length);
    color = _colors.elementAt(index);
    notifyListeners();
  }
}
