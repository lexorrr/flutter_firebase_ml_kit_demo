import 'package:flutter/material.dart';
import 'package:flutter_firebase_ml_kit_demo/provider/face_provider.dart';
import 'package:provider/provider.dart';

class DetectionImgPicker extends StatelessWidget {
  const DetectionImgPicker();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        direction: Axis.vertical,
        spacing: 30,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: <Widget>[
          Icon(Icons.tag_faces,
            size: 40,
            color: Colors.blueAccent,
          ),
          Consumer<FaceProvider>(
            builder: (context, faceDetector, _) {
              return ElevatedButton(
                child: const Text('Detect faces'),
                onPressed: () => faceDetector.setDetectorVisible(true),
              );
            },
          ),
        ],
      ),
    );
  }
}
