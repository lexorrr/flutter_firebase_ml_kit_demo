import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui show Image;

class RectanglePainter extends CustomPainter {
  final List<Face> facesPositions;
  final ui.Image selectedImage;

  static final Paint _painter = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 3.0
    ..color = Colors.redAccent;

  const RectanglePainter(
      {@required this.facesPositions, @required this.selectedImage});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawImage(selectedImage, Offset.zero, Paint());

    for (final face in facesPositions) {
      final coords = face.boundingBox;
      final rect =
          Rect.fromLTRB(coords.left, coords.top, coords.right, coords.bottom);
      
      canvas.drawRect(rect, _painter);
    }
  }

  @override
  bool shouldRepaint(covariant RectanglePainter oldDelegate) =>
      selectedImage != oldDelegate.selectedImage ||
      facesPositions != oldDelegate.facesPositions;
}
