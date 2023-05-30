
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MainModel with ChangeNotifier, DiagnosticableTreeMixin {
  int _currentIndex = 0;

  int get counter => _currentIndex;

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('counter', _currentIndex));
  }

  incrementCounter(int value) {
    _currentIndex = _currentIndex + value;
    notifyListeners();
  }
}