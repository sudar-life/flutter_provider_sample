import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterProvider extends ChangeNotifier {
  int _count = 0;
  int get count => _count;
  add() {
    _count++;
    notifyListeners();
  }

  subtract() {
    _count--;
    notifyListeners();
  }
}
