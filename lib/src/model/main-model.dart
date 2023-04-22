
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MainModel with ChangeNotifier, DiagnosticableTreeMixin {
  int _counter = 0;

  int get counter => _counter;

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('counter', _counter));
  }

  incrementCounter(int value) {
      _counter = _counter + value;
      notifyListeners();
  }
}