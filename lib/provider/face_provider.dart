import 'package:flutter/material.dart';

class FaceProvider with ChangeNotifier {
  bool _showDetector = false;

  bool get isDetectorVisible => _showDetector;

  void setDetectorVisible(bool isVisible) {
    _showDetector = isVisible;
    notifyListeners();
  }
}