//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
//
// class FaceRecogenation extends StatelessWidget {
//   const FaceRecogenation({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFE5E5E5),
//       appBar: AppBar(
//         title: Text("Face Recogintion"),
//       ),
//       body: Container(
//
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(vertical: 26),
//             child: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//
//                 children: [
//
//                   Image.asset('assets/images/face3-removebg-preview.png'),
//                   SizedBox(
//                     height: 50,
//                   ),
//                   // Container(
//                   //   decoration: BoxDecoration(
//                   //     color: const Color.fromARGB(255, 187, 186, 182),
//                   //     borderRadius: BorderRadius.circular(66),
//                   //   ),
//                   //   width: 266,
//                   //   padding: const EdgeInsets.symmetric(horizontal: 16),
//                   //   child: TextField(
//                   //
//                   //     decoration: const InputDecoration(
//                   //       hintText: "Take authorization",
//                   //
//                   //       border: InputBorder.none,
//                   //     ),
//                   //   ),
//                   // ),
//                ElevatedButton(onPressed:() {},  style: ButtonStyle(
//                  backgroundColor: MaterialStateProperty.all(
//                      const Color.fromARGB(255, 39, 112, 176)),
//                  padding: MaterialStateProperty.all(
//                      EdgeInsets.symmetric(horizontal: 70, vertical: 15)),
//                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
//                      borderRadius: BorderRadius.circular(27))),
//                ),
//                  child: Text(
//                    "Take Athorithaion",
//                    style: TextStyle(
//                        fontSize: 17,
//                        color: const Color.fromARGB(255, 252, 252, 252)),
//                  ),
//                ),
//                   SizedBox(
//                     height: 50,
//                   ),
//                   // Container(
//                   //   decoration: BoxDecoration(
//                   //     color: const Color.fromARGB(255, 187, 186, 182),
//                   //     borderRadius: BorderRadius.circular(66),
//                   //   ),
//                   //   width: 266,
//                   //   padding: const EdgeInsets.symmetric(horizontal: 16),
//                   //   child: TextField(
//                   //
//                   //     decoration: const InputDecoration(
//                   //       hintText: "Take a picture",
//                   //
//                   //       border: InputBorder.none,
//                   //     ),
//                   //   ),
//                   //
//                   // ),
//                   ElevatedButton(onPressed:() {},
//
//
//                     style: ButtonStyle(
//                       backgroundColor: MaterialStateProperty.all(
//                           const Color.fromARGB(255, 39, 112, 176)),
//                       padding: MaterialStateProperty.all(
//                           EdgeInsets.symmetric(horizontal: 80, vertical: 15)),
//                       shape: MaterialStateProperty.all(RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(27))),
//                     ),
//                     child: Text(
//                       "Take A picture",
//                       style: TextStyle(
//                           fontSize: 17,
//                           color: const Color.fromARGB(255, 252, 252, 252)),
//                     ),
//                   ),
//
//
//                   SizedBox(
//                    height: 50,
//                  ),
//
//                   // ElevatedButton(
//                   //   onPressed: () {
//                   //     Navigator.pushNamed(context,  '/qrpage');
//                   //   },
//                   //   style: ButtonStyle(
//                   //     backgroundColor: MaterialStateProperty.all(
//                   //         Color.fromARGB(255, 90, 118, 174)),
//                   //     padding: MaterialStateProperty.all(
//                   //         EdgeInsets.symmetric(horizontal: 106, vertical: 10)),
//                   //     shape: MaterialStateProperty.all(RoundedRectangleBorder(
//                   //         borderRadius: BorderRadius.circular(27))),
//                   //   ),
//                   //
//                   //   child: Text(
//                   //     "qr",
//                   //     style: TextStyle(fontSize: 24),
//                   //   ),
//                   // ),
//
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
// class FaceRecogination extends StatelessWidget {
//   const FaceRecogination({Key? key}) : super(key: key);
//
//   Future<void> _takePicture(BuildContext context) async {
//     final ImagePicker _picker = ImagePicker();
//     final XFile? image = await _picker.pickImage(source: ImageSource.camera);
//     // You can do something with the captured image here, like saving it or displaying it.
//   }
//
//   Future<void> _uploadPhoto(BuildContext context) async {
//     final ImagePicker _picker = ImagePicker();
//     final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
//     // You can do something with the uploaded image here, like displaying it.
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFE5E5E5),
//       appBar: AppBar(
//         title: Text("Face Recognition"),
//       ),
//       body: Container(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(vertical: 26),
//             child: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Image.asset('assets/images/face3-removebg-preview.png'),
//                   SizedBox(
//                     height: 50,
//                   ),
//                   ElevatedButton(
//                     onPressed: () => _takePicture(context),
//                     style: ButtonStyle(
//                       backgroundColor: MaterialStateProperty.all(
//                           const Color.fromARGB(255, 39, 112, 176)),
//                       padding: MaterialStateProperty.all(
//                           EdgeInsets.symmetric(horizontal: 80, vertical: 15)),
//                       shape: MaterialStateProperty.all(RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(27))),
//                     ),
//                     child: Text(
//                       "Take A Picture",
//                       style: TextStyle(
//                           fontSize: 17,
//                           color: const Color.fromARGB(255, 252, 252, 252)),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 50,
//                   ),
//                   ElevatedButton(
//                     onPressed: () => _uploadPhoto(context),
//                     style: ButtonStyle(
//                       backgroundColor: MaterialStateProperty.all(
//                           const Color.fromARGB(255, 39, 112, 176)),
//                       padding: MaterialStateProperty.all(
//                           EdgeInsets.symmetric(horizontal: 70, vertical: 15)),
//                       shape: MaterialStateProperty.all(RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(27))),
//                     ),
//                     child: Text(
//                       "Upload Photo",
//                       style: TextStyle(
//                           fontSize: 17,
//                           color: const Color.fromARGB(255, 252, 252, 252)),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 50,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class FaceDetectionScreen extends StatefulWidget {
  const FaceDetectionScreen({Key? key}) : super(key: key);

  @override
  _FaceDetectionScreenState createState() => _FaceDetectionScreenState();
}

class _FaceDetectionScreenState extends State<FaceDetectionScreen> {
  File? _image;
  final String _username = "FadyKarmyyy"; // Set the username here

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

    final url = Uri.parse('http://192.168.221.115:8000/recognize/');
    final request = http.MultipartRequest('POST', url);
    request.files.add(
      await http.MultipartFile.fromPath('image', _image!.path),
    );
    request.fields['username'] = _username; // Add the username field

    try {
      final response = await request.send();
      if (response.statusCode == 200) {
        final List<dynamic> recognizedNames = jsonDecode(await response.stream.bytesToString());
        // Handle recognized names here
        print(recognizedNames);
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
            ],
          ),
        ),
      ),
    );
  }
}
