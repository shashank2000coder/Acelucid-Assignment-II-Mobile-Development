import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      home: CaptureImageScreen(),
    );
  }
}

class CaptureImageScreen extends StatefulWidget {
  @override
  _CaptureImageScreenState createState() => _CaptureImageScreenState();
}

class _CaptureImageScreenState extends State<CaptureImageScreen> {
  File? _capturedImage; 
  final ImagePicker _imagePicker = ImagePicker(); 
  Future<void> captureImage() async {
    try {
      final pickedImage = await _imagePicker.pickImage(source: ImageSource.camera); 
      if (pickedImage != null) {
        setState(() {
          _capturedImage = File(pickedImage.path);
        });
      }
    } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to capture image: $error'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Capture and Show Image'), 
        backgroundColor: Colors.blue, 
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _capturedImage != null
                ? Image.file(
                    _capturedImage!,
                    width: 250,
                    height: 250,
                  )
                : Text(
                    'No image captured yet!',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: captureImage,
              child: Text('Capture Image'),
              style: ElevatedButton.styleFrom(
                primary: Colors.green, 
              ),
            ),
          ],
        ),
      ),
    );
  }
}
