import 'package:flutter/material.dart';
import 'package:flutter_firebase_ml_kit_demo/detector/face_detector_data.dart';
import 'package:flutter_firebase_ml_kit_demo/detector/face_detector_model.dart';
import 'package:flutter_firebase_ml_kit_demo/detector/rectangle_painter.dart';
import 'package:flutter_firebase_ml_kit_demo/provider/face_provider.dart';
import 'package:provider/provider.dart';

class DetectFacesFromImage extends StatefulWidget {
  const DetectFacesFromImage();

  @override
  _DetectFacesFromImageState createState() => _DetectFacesFromImageState();
}

class _DetectFacesFromImageState extends State<DetectFacesFromImage> {
  Future<FaceDetectorData> _faces;
  final _model = FaceDetectorModel();

  @override
  void initState() {
    super.initState();

    _faces = _model.detectedFaces();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FaceDetectorData>(
      future: _faces,
      builder: (context, faceList) {
        if (faceList.hasData) {
          final data = faceList.data;

          if (data != null) {
            return Center(
              child: Wrap(
                spacing: 10,
                crossAxisAlignment: WrapCrossAlignment.center,
                direction: Axis.vertical,
                children: <Widget>[
                  SizedBox(
                    width: 260,
                    height: 250,
                    child: CustomPaint(
                      painter: RectanglePainter(
                        facesPositions: data.faces,
                        selectedImage: data.image
                      ),
                    ),
                  ),
                  Consumer<FaceProvider>(
                      builder: (context, detector, _) {
                        return ElevatedButton(
                          child: const Text('New detection'),
                          onPressed: () => detector.setDetectorVisible(false),
                        );
                      }
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: Text('Error while processing data :('),
            );
          }
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
