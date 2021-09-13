import 'package:flutter/material.dart';

class CountProvider with ChangeNotifier {
  int _count = 1; //
  int get count => _count;

  updateCount() {
    this._count++;
    notifyListeners();
  }
}
