import 'package:flutter/cupertino.dart';

class Counter with ChangeNotifier {
  int _counter = 0;

  int get getCounter => _counter;

  set setCounter(int value) => _counter = value;

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  void decrementCounter() {
    _counter--;
    notifyListeners();
  }
}
