import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter_firebase_ml_kit_demo/detector/face_detector_data.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:ui' as ui;

class FaceDetectorModel {
  const FaceDetectorModel();

  Future<FaceDetectorData> detectedFaces() async {
    // Choose the image
    final picker = ImagePicker();
    final imageFile = await picker.getImage(
      source: ImageSource.gallery,
      maxHeight: 250,
      maxWidth: 260,
    );

    // Detect faces
    final file = File(imageFile.path);
    final image = FirebaseVisionImage.fromFile(file);
    final detector = FirebaseVision.instance.faceDetector();

    // Process data
    final faces = await detector.processImage(image);
    final canvasImage = await _decodeImage(file);
    return FaceDetectorData(faces, canvasImage);
  }

  Future<ui.Image> _decodeImage(File file) async {
    final rawFile = await file.readAsBytes();
    final codec = await ui.instantiateImageCodec(rawFile);
    final frameInfo = await codec.getNextFrame();
    return frameInfo.image;
  }
}