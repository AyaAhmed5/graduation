// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:image_picker/image_picker.dart';
//
// class FaceDetectionScreen extends StatefulWidget {
//   const FaceDetectionScreen({Key? key}) : super(key: key);
//
//   @override
//   _FaceDetectionScreenState createState() => _FaceDetectionScreenState();
// }
//
// class _FaceDetectionScreenState extends State<FaceDetectionScreen> {
//   File? _image;
//   List<String> _recognizedNames = [];
//
//   Future<void> _pickImage(ImageSource source) async {
//     try {
//       final image = await ImagePicker().pickImage(source: source);
//       if (image == null) return;
//       setState(() {
//         _image = File(image.path);
//       });
//     } catch (e) {
//       if (kDebugMode) {
//         print(e);
//       }
//     }
//   }
//
//   Future<void> _recognizeFace() async {
//     if (_image == null) return;
//
//     final url = Uri.parse('http://192.168.30.115:8000/recognize/');
//     final request = http.MultipartRequest('POST', url);
//     request.files.add(
//       await http.MultipartFile.fromPath('image', _image!.path),
//     );
//
//     try {
//       final response = await request.send();
//       if (response.statusCode == 200) {
//         final List<dynamic> recognizedNames = jsonDecode(await response.stream.bytesToString());
//         setState(() {
//           _recognizedNames = recognizedNames.cast<String>();
//         });
//       } else {
//         print('Failed to recognize face: ${response.reasonPhrase}');
//       }
//     } catch (e) {
//       print('Error recognizing face: $e');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Face Recognition'),
//         ),
//         body: Center(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Column(
//                 children: [
//                   Container(
//                     width: double.infinity,
//                     height: 250,
//                     color: Colors.grey,
//                     child: Center(
//                       child: _image == null
//                           ? const Icon(
//                         Icons.add_a_photo,
//                         size: 60,
//                       )
//                           : Image.file(_image!),
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   Container(
//                     width: double.infinity,
//                     height: 50,
//                     color: const Color.fromARGB(255, 7, 61, 105),
//                     child: MaterialButton(
//                       onPressed: () {
//                         _pickImage(ImageSource.camera);
//                       },
//                       child: const Text(
//                         'Take a photo',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 23,
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   Container(
//                     width: double.infinity,
//                     height: 50,
//                     color: const Color.fromARGB(255, 7, 61, 105),
//                     child: MaterialButton(
//                       onPressed: _recognizeFace,
//                       child: const Text(
//                         'Recognize Face',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 23,
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   if (_recognizedNames.isNotEmpty)
//                     Text(
//                       'First Recognized Name: ${_recognizedNames.first}',
//                       style: const TextStyle(fontSize: 18),
//                     ),
//                   const SizedBox(height: 10),
//                   Expanded(
//                     child: ListView.builder(
//                       itemCount: _recognizedNames.length,
//                       itemBuilder: (context, index) {
//                         return ListTile(
//                           title: Text(_recognizedNames[index]),
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             ),
//         );
//     }
// }



import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:logaya/qr.dart';

class FaceDetectionScreen extends StatefulWidget {
  const FaceDetectionScreen({Key? key}) : super(key: key);

  @override
  _FaceDetectionScreenState createState() => _FaceDetectionScreenState();
}

class _FaceDetectionScreenState extends State<FaceDetectionScreen> {
  File? _image;
  List<String> _recognizedNames = [];

  Future<void> _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      setState(() {
        _image = File(image.path);
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> _recognizeFace() async {
    if (_image == null) return;

    final url = Uri.parse('http://192.168.206.115:8000/recognize/');
    final request = http.MultipartRequest('POST', url);
    request.files.add(
      await http.MultipartFile.fromPath('image', _image!.path),
    );

    try {
      final response = await request.send();
      if (response.statusCode == 200) {
        final List<dynamic> recognizedNames = jsonDecode(await response.stream.bytesToString());
        setState(() {
          _recognizedNames = recognizedNames.cast<String>();
        });

        if ( _recognizedNames.first != 'unknown') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => QRScanPage()),
          );
        }
      } else {
        print('Failed to recognize face: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error recognizing face: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Face Recognition'),
        ),
        body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 250,
                    color: Colors.grey,
                    child: Center(
                      child: _image == null
                          ? const Icon(
                        Icons.add_a_photo,
                        size: 60,
                      )
                          : Image.file(_image!),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    height: 50,
                    color: const Color.fromARGB(255, 7, 61, 105),
                    child: MaterialButton(
                      onPressed: () {
                        _pickImage(ImageSource.camera);
                      },
                      child: const Text(
                        'Take a photo',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    height: 50,
                    color: const Color.fromARGB(255, 7, 61, 105),
                    child: MaterialButton(
                      onPressed: _recognizeFace,
                      child: const Text(
                        'Recognize Face',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  if (_recognizedNames.isNotEmpty)
                    Text(
                      'First Recognized Name: ${_recognizedNames.first}',
                      style: const TextStyle(fontSize: 18),
                    ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _recognizedNames.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(_recognizedNames[index]),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            ),
      );
   }
}