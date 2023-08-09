import 'package:flutter/material.dart';

class SimpleModel extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increase() {
    _count++;
    notifyListeners();
  }
}
