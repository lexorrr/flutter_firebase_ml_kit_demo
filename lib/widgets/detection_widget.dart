import 'package:flutter/material.dart';
import 'package:flutter_firebase_ml_kit_demo/detector/face_detector_data.dart';
import 'package:flutter_firebase_ml_kit_demo/provider/face_provider.dart';
import 'package:flutter_firebase_ml_kit_demo/widgets/detection_img_picker.dart';
import 'package:flutter_firebase_ml_kit_demo/widgets/face_detector_widget.dart';
import 'package:provider/provider.dart';

class DetectionWidget extends StatelessWidget {
  const DetectionWidget();

  @override
  Widget build(BuildContext context) {
    return Consumer<FaceProvider>(
      builder: (context, faceDetector, _) {
        if (faceDetector.isDetectorVisible) {
          return const DetectFacesFromImage();
        }

        return const DetectionImgPicker();
      },
    );
  }
}
