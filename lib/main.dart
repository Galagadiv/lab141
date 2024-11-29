import 'dart:async';
import 'dart:io'; // Import this library for the File class
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Native Camera App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CameraPage(),
    );
  }
}

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  String _nativeMessage = 'Hi, mom';
  XFile? _image;

  final ImagePicker _picker = ImagePicker();
  static const MethodChannel _channel =
  MethodChannel('com.example.native_camera_app/native');

  // Future<void> _getNativeMessage() async {
  //   String message;
  //   try {
  //     message = await _channel.invokeMethod('getStaticString');
  //   } on PlatformException catch (e) {
  //     message = 'Failed to get message: ${e.message}';
  //   }
  //
  //   setState(() {
  //     _nativeMessage = message;
  //   });
  // }
  String Message = 'Hi, mom';
  Future<void> _showDialog(String message) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(
                'https://emojiisland.com/cdn/shop/products/Robot_Emoji_Icon_abe1111a-1293-4668-bdf9-9ceb05cff58e_large.png?v=1571606090',
                height: 100,
              ),
              const SizedBox(height: 20),
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Закриває діалог
              },
            ),
          ],
        );
      },
    );
  }
  Future<void> _takePhoto() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = photo;
    });
  }
  Future<void> _delPhoto() async {
    setState(() {
      _image = null;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Лаб14')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: () => _showDialog(Message),
            child: const Text('Show String'),
          ),
          const SizedBox(height: 20),
          _image != null
              ? Image.file(
            File(_image!.path),
            fit: BoxFit.cover,
          )
              : const Text('No image yet'),
          ElevatedButton(
            onPressed: _takePhoto,
            child: const Text('Take Photo'),
          ),
          ElevatedButton(
            onPressed: _delPhoto,
            child: const Text('Delete Photo'),
          ),
        ],
      ),
    );
  }
}
