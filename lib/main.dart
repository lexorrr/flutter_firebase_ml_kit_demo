import 'package:flutter/material.dart';
import 'package:flutter_firebase_ml_kit_demo/provider/face_provider.dart';
import 'package:flutter_firebase_ml_kit_demo/widgets/detection_img_picker.dart';
import 'package:flutter_firebase_ml_kit_demo/widgets/detection_widget.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Face detection'),
      ),
      body: Center(
        child: ChangeNotifierProvider<FaceProvider>(
          create: (_) => FaceProvider(),
          child: const DetectionWidget(),
        ),
      ),
    );
  }
}
