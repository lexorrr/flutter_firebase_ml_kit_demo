import 'dart:ui' as ui;

import 'package:firebase_ml_vision/firebase_ml_vision.dart';

class FaceDetectorData {
  final List<Face> faces;
  final ui.Image image;
  const FaceDetectorData(this.faces, this.image);
}