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
//     final url = Uri.parse('http://192.168.137.46:8000/recognize/');
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
//
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
//   String _recognizedNames = '';
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
//     final url = Uri.parse('http://192.168.130.115:8000/recognize/');
//     final request = http.MultipartRequest('POST', url);
//     request.files.add(
//       await http.MultipartFile.fromPath('image', _image!.path),
//     );
//
//     try {
//       final response = await request.send();
//       if (response.statusCode == 200) {
//         final recognizedNames = await response.stream.bytesToString();
//         setState(() {
//           _recognizedNames = recognizedNames;
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
//       appBar: AppBar(
//         title: const Text('Face Recognition'),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             children: [
//               Container(
//                 width: double.infinity,
//                 height: 250,
//                 color: Colors.grey,
//                 child: Center(
//                   child: _image == null
//                       ? const Icon(
//                     Icons.add_a_photo,
//                     size: 60,
//                   )
//                       : Image.file(_image!),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               Container(
//                 width: double.infinity,
//                 height: 50,
//                 color: const Color.fromARGB(255, 7, 61, 105),
//                 child: MaterialButton(
//                   onPressed: () {
//                     _pickImage(ImageSource.camera);
//                   },
//                   child: const Text(
//                     'Take a photo',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 23,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               Container(
//                 width: double.infinity,
//                 height: 50,
//                 color: const Color.fromARGB(255, 7, 61, 105),
//                 child: MaterialButton(
//                   onPressed: _recognizeFace,
//                   child: const Text(
//                     'Recognize Face',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 23,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               if (_recognizedNames.isNotEmpty)
//                 Text(
//                   'Recognized Names: $_recognizedNames',
//                   style: const TextStyle(fontSize: 18),
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:image_picker/image_picker.dart';
// import 'package:logaya/authorization.dart';
// import 'package:logaya/qr.dart';
//
// class FaceDetectionScreen extends StatefulWidget {
//   final String username;
//
//   const FaceDetectionScreen({Key? key, required this.username}) : super(key: key);
//
//   @override
//   _FaceDetectionScreenState createState() => _FaceDetectionScreenState();
// }
//
// class _FaceDetectionScreenState extends State<FaceDetectionScreen> {
//   File? _image;
//   String _recognizedNames = '';
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
//   Future<void> _recognizeFace() async {
//     if (_image == null) return;
//
//     final url = Uri.parse('http://192.168.130.115:8000/recognize/');
//     final request = http.MultipartRequest('POST', url);
//     request.files.add(
//       await http.MultipartFile.fromPath('image', _image!.path),
//     );
//
//     try {
//       final response = await request.send();
//       if (response.statusCode == 200) {
//         final recognizedNames = await response.stream.bytesToString();
//         setState(() {
//           _recognizedNames = recognizedNames;
//         });
//
//         if (_recognizedNames.isNotEmpty && _recognizedNames == widget.username) {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => QRScanPage()),
//           );
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text('Face not recognized. Please try again.'),
//             ),
//           );
//         }
//       } else {
//         print('Failed to recognize face: ${response.reasonPhrase}');
//       }
//     } catch (e) {
//       print('Error recognizing face: $e');
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Face Recognition'),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) {
//                   return autho();
//                 },
//               ),
//             );
//           },
//         ),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             children: [
//               Container(
//                 width: double.infinity,
//                 height: 250,
//                 color: Colors.grey,
//                 child: Center(
//                   child: _image == null
//                       ? const Icon(
//                     Icons.add_a_photo,
//                     size: 60,
//                   )
//                       : Image.file(_image!),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               Container(
//                 width: double.infinity,
//                 height: 50,
//                 color: const Color.fromARGB(255, 7, 61, 105),
//                 child: MaterialButton(
//                   onPressed: () {
//                     _pickImage(ImageSource.camera);
//                   },
//                   child: const Text(
//                     'Take a photo',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 23,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               Container(
//                 width: double.infinity,
//                 height: 50,
//                 color: const Color.fromARGB(255, 7, 61, 105),
//                 child: MaterialButton(
//                   onPressed: _recognizeFace,
//                   child: const Text(
//                     'Recognize Face',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 23,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               if (_recognizedNames.isNotEmpty)
//                 Text(
//                   'Recognized Names: $_recognizedNames',
//                   style: const TextStyle(fontSize: 18),
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//


//
// //
// // import 'dart:convert';
// // import 'dart:io';
// // import 'package:flutter/foundation.dart';
// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;
// // import 'package:image_picker/image_picker.dart';
// // import 'package:logaya/qr.dart';
// //
// // class FaceDetectionScreen extends StatefulWidget {
// //   const FaceDetectionScreen({Key? key}) : super(key: key);
// //
// //   @override
// //   _FaceDetectionScreenState createState() => _FaceDetectionScreenState();
// // }
// //
// // class _FaceDetectionScreenState extends State<FaceDetectionScreen> {
// //   File? _image;
// //   List<String> _recognizedNames = [];
// //
// //   Future<void> _pickImage(ImageSource source) async {
// //     try {
// //       final image = await ImagePicker().pickImage(source: source);
// //       if (image == null) return;
// //       setState(() {
// //         _image = File(image.path);
// //       });
// //     } catch (e) {
// //       if (kDebugMode) {
// //         print(e);
// //       }
// //     }
// //   }
// //
// //   Future<void> _recognizeFace() async {
// //     if (_image == null) return;
// //
// //     final url = Uri.parse('http://192.168.206.115:8000/recognize/');
// //     final request = http.MultipartRequest('POST', url);
// //     request.files.add(
// //       await http.MultipartFile.fromPath('image', _image!.path),
// //     );
// //
// //     try {
// //       final response = await request.send();
// //       if (response.statusCode == 200) {
// //         final List<dynamic> recognizedNames = jsonDecode(await response.stream.bytesToString());
// //         setState(() {
// //           _recognizedNames = recognizedNames.cast<String>();
// //         });
// //
// //         if ( _recognizedNames.first != 'unknown') {
// //           Navigator.push(
// //             context,
// //             MaterialPageRoute(builder: (context) => QRScanPage()),
// //           );
// //         }
// //       } else {
// //         print('Failed to recognize face: ${response.reasonPhrase}');
// //       }
// //     } catch (e) {
// //       print('Error recognizing face: $e');
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         appBar: AppBar(
// //           title: const Text('Face Recognition'),
// //         ),
// //         body: Center(
// //             child: Padding(
// //               padding: const EdgeInsets.symmetric(horizontal: 20),
// //               child: Column(
// //                 children: [
// //                   Container(
// //                     width: double.infinity,
// //                     height: 250,
// //                     color: Colors.grey,
// //                     child: Center(
// //                       child: _image == null
// //                           ? const Icon(
// //                         Icons.add_a_photo,
// //                         size: 60,
// //                       )
// //                           : Image.file(_image!),
// //                     ),
// //                   ),
// //                   const SizedBox(height: 10),
// //                   Container(
// //                     width: double.infinity,
// //                     height: 50,
// //                     color: const Color.fromARGB(255, 7, 61, 105),
// //                     child: MaterialButton(
// //                       onPressed: () {
// //                         _pickImage(ImageSource.camera);
// //                       },
// //                       child: const Text(
// //                         'Take a photo',
// //                         style: TextStyle(
// //                           color: Colors.white,
// //                           fontSize: 23,
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                   const SizedBox(height: 10),
// //                   Container(
// //                     width: double.infinity,
// //                     height: 50,
// //                     color: const Color.fromARGB(255, 7, 61, 105),
// //                     child: MaterialButton(
// //                       onPressed: _recognizeFace,
// //                       child: const Text(
// //                         'Recognize Face',
// //                         style: TextStyle(
// //                           color: Colors.white,
// //                           fontSize: 23,
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                   const SizedBox(height: 10),
// //                   if (_recognizedNames.isNotEmpty)
// //                     Text(
// //                       'First Recognized Name: ${_recognizedNames.first}',
// //                       style: const TextStyle(fontSize: 18),
// //                     ),
// //                   const SizedBox(height: 10),
// //                   Expanded(
// //                     child: ListView.builder(
// //                       itemCount: _recognizedNames.length,
// //                       itemBuilder: (context, index) {
// //                         return ListTile(
// //                           title: Text(_recognizedNames[index]),
// //                         );
// //                       },
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //             ),
// //       );
// //    }
// // }
//
// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:image_picker/image_picker.dart';
// import 'package:logaya/qr.dart';
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
//     final url = Uri.parse('http://192.168.137.46:8000/recognize/');
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
//
//         if (_recognizedNames.isNotEmpty && _recognizedNames.first != 'unknown') {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => QRScanPage()),
//           );
//         } else {
//           // Show a message to the user that the face is not recognized
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Text('Face not recognized. Please try again.'),
//             ),
//           );
//         }
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
//       appBar: AppBar(
//         title: const Text('Face Recognition'),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             children: [
//               Container(
//                 width: double.infinity,
//                 height: 250,
//                 color: Colors.grey,
//                 child: Center(
//                   child: _image == null
//                       ? const Icon(
//                     Icons.add_a_photo,
//                     size: 60,
//                   )
//                       : Image.file(_image!),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               Container(
//                 width: double.infinity,
//                 height: 50,
//                 color: const Color.fromARGB(255, 7, 61, 105),
//                 child: MaterialButton(
//                   onPressed: () => _pickImage(ImageSource.camera),
//                   child: const Text(
//                     'Take a photo',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 23,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               Container(
//                 width: double.infinity,
//                 height: 50,
//                 color: const Color.fromARGB(255, 7, 61, 105),
//                 child: MaterialButton(
//                   onPressed: _recognizeFace,
//                   child: const Text(
//                     'Recognize Face',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 23,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               if (_recognizedNames.isNotEmpty)
//                 Text(
//                   'First Recognized Name: ${_recognizedNames.first}',
//                   style: const TextStyle(fontSize: 18),
//                 ),
//               const SizedBox(height: 10),
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: _recognizedNames.length,
//                   itemBuilder: (context, index) {
//                     return ListTile(
//                       title: Text(_recognizedNames[index]),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }




















//
// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:image_picker/image_picker.dart';
// import 'package:jwt_decode/jwt_decode.dart';
// import 'package:logaya/authorization.dart';
// import 'package:logaya/qr.dart';
//
// import 'core/network/end_points.dart';
//
// class FaceDetectionScreen extends StatefulWidget {
//   final String? username;
//
//   const FaceDetectionScreen({Key? key, this.username}) : super(key: key);
//
//   @override
//   _FaceDetectionScreenState createState() => _FaceDetectionScreenState();
// }
//
// class _FaceDetectionScreenState extends State<FaceDetectionScreen> {
//   File? _image;
//   String _recognizedNames = '';
//
//   Map<String, dynamic> payload = Jwt.parseJwt('Bearer $userToken');
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
//   //
//   // Future<void> _recognizeFace() async {
//   //   if (_image == null) return;
//   //
//   //   final url = Uri.parse('http://192.168.87.115:8000/recognize/');
//   //   final request = http.MultipartRequest('POST', url);
//   //   request.files.add(
//   //     await http.MultipartFile.fromPath('image', _image!.path),
//   //   );
//   //
//   //   try {
//   //     final response = await request.send();
//   //     if (response.statusCode == 200) {
//   //       final recognizedNames = await response.stream.bytesToString();
//   //       setState(() {
//   //         _recognizedNames = recognizedNames;
//   //       });
//   //       if (_recognizedNames == "Unknown" ) {
//   //         print("kdmkmd");
//   //         Navigator.push(
//   //           context,
//   //           MaterialPageRoute(builder: (context) => QRScanPage()),
//   //         );
//   //       } else {
//   //         ScaffoldMessenger.of(context).showSnackBar(
//   //           SnackBar(
//   //             content: Text('Try again to take a photo'),
//   //           ),
//   //         );
//   //       }
//   //
//   //       print(widget.username);
//   //       print(_recognizedNames);
//   //     } else {
//   //       print('Failed to recognize face: ${response.reasonPhrase}');
//   //     }
//   //   } catch (e) {
//   //     print('Error recognizing face: $e');
//   //   }
//   // }
//   Future<void> _recognizeFace() async {
//
//     if (_image == null) return;
//     final url = Uri.parse('http://10.177.240.139:8000/recognize/');
//     final request = http.MultipartRequest('POST', url);
//     request.files.add(
//       await http.MultipartFile.fromPath('image', _image!.path),
//     );
//
//     try {
//       final response = await request.send();
//       if (response.statusCode == 200) {
//         final recognizedName = await response.stream.bytesToString();
//         final apiResponse = await fetchUserDataFromApi(); // Fetch username from API
//
//         if (recognizedName == apiResponse['username']) {
//           print("aa");
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => QRScanPage()),
//           );
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text('Username does not match. Try again.'),
//             ),
//           );
//         }
//       } else {
//         print('Failed to recognize face: ${response.reasonPhrase}');
//       }
//     } catch (e) {
//       print('Error recognizing face: $e');
//     }
//   }
//
//   Future<Map<String, dynamic>> fetchUserDataFromApi() async {
//     final apiResponse = await http.get(Uri.parse('http://yasmeentest55847.runasp.net/api/Auth/SignUpStudent'));
//     if (apiResponse.statusCode == 200) {
//       return json.decode(apiResponse.body);
//     } else {
//       throw Exception('Failed to fetch user data from API');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Face Recognition'),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) {
//                   return autho();
//                 },
//               ),
//             );
//           },
//         ),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             children: [
//               Container(
//                 width: double.infinity,
//                 height: 250,
//                 color: Colors.grey,
//                 child: Center(
//                   child: _image == null
//                       ? const Icon(
//                     Icons.add_a_photo,
//                     size: 60,
//                   )
//                       : Image.file(_image!),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               Container(
//                 width: double.infinity,
//                 height: 50,
//                 color: const Color.fromARGB(255, 7, 61, 105),
//                 child: MaterialButton(
//                   onPressed: () {
//                     _pickImage(ImageSource.camera);
//                   },
//                   child: const Text(
//                     'Take a photo',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 23,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               Container(
//                 width: double.infinity,
//                 height: 50,
//                 color: const Color.fromARGB(255, 7, 61, 105),
//                 child: MaterialButton(
//                   onPressed: _recognizeFace,
//                   child: const Text(
//                     'Recognize Face',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 23,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               if (_recognizedNames.isNotEmpty)
//                 Text(
//                   'Recognized Names: $_recognizedNames',
//                   style: const TextStyle(fontSize: 18),
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

















//
//
//
// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:image_picker/image_picker.dart';
// import 'package:jwt_decode/jwt_decode.dart';
// import 'package:logaya/authorization.dart';
// import 'package:logaya/qr.dart';
// import 'core/helper/cach.dart';
// import 'core/network/end_points.dart';
//
//
// class FaceDetectionScreen extends StatefulWidget {
//   final String? username;
//
//   const FaceDetectionScreen({Key? key, this.username}) : super(key: key);
//
//   @override
//   _FaceDetectionScreenState createState() => _FaceDetectionScreenState();
// }
//
// class _FaceDetectionScreenState extends State<FaceDetectionScreen> {
//   File? _image;
//   String _recognizedNames = '';
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
//     final token = await ChachHelper.getData(key: 'Bearer $userToken'); // Retrieve token
//     if (token == null) {
//       print('No token found');
//       return;
//     }
//
//     // Parse the JWT token to get the payload
//     Map<String, dynamic> payload = Jwt.parseJwt(token);
//     String? usernameFromToken = payload['username'];
//
//     final url = Uri.parse('http://10.177.240.103:8000/recognize/');
//     final request = http.MultipartRequest('POST', url);
//     request.headers['Authorization'] = 'Bearer $userToken'; // Add token to headers
//     request.files.add(
//       await http.MultipartFile.fromPath('image', _image!.path),
//     );
//
//     try {
//       final response = await request.send();
//       if (response.statusCode == 200) {
//         final recognizedName = await response.stream.bytesToString();
//
//         if (recognizedName == usernameFromToken) {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => QRScanPage()),
//           );
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text('Username does not match. Try again.'),
//             ),
//           );
//         }
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
//       appBar: AppBar(
//         title: const Text('Face Recognition'),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) {
//                   return autho();
//                 },
//               ),
//             );
//           },
//         ),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             children: [
//               Container(
//                 width: double.infinity,
//                 height: 250,
//                 color: Colors.grey,
//                 child: Center(
//                   child: _image == null
//                       ? const Icon(
//                     Icons.add_a_photo,
//                     size: 60,
//                   )
//                       : Image.file(_image!),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               Container(
//                 width: double.infinity,
//                 height: 50,
//                 color: const Color.fromARGB(255, 7, 61, 105),
//                 child: MaterialButton(
//                   onPressed: () {
//                     _pickImage(ImageSource.camera);
//                   },
//                   child: const Text(
//                     'Take a photo',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 23,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               Container(
//                 width: double.infinity,
//                 height: 50,
//                 color: const Color.fromARGB(255, 7, 61, 105),
//                 child: MaterialButton(
//                   onPressed: _recognizeFace,
//                   child: const Text(
//                     'Recognize Face',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 23,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               if (_recognizedNames.isNotEmpty)
//                 Text(
//                   'Recognized Names: $_recognizedNames',
//                   style: const TextStyle(fontSize: 18),
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// //
//
//
// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:image_picker/image_picker.dart';
// import 'package:jwt_decode/jwt_decode.dart';
// import 'package:logaya/authorization.dart';
// import 'package:logaya/qr.dart';
// import 'core/helper/cach.dart';
// import 'core/network/end_points.dart';
//
// class FaceDetectionScreen extends StatefulWidget {
//   final String? username;
//
//   const FaceDetectionScreen({Key? key, this.username}) : super(key: key);
//
//   @override
//   _FaceDetectionScreenState createState() => _FaceDetectionScreenState();
// }
//
// class _FaceDetectionScreenState extends State<FaceDetectionScreen> {
//   File? _image;
//   String _recognizedNames = '';
//
//   @override
//   void initState() {
//     super.initState();
//     ChachHelper.init(); // Initialize shared preferences
//   }
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
//     final token = ChachHelper.getData(key: 'Bearer $userToken'); // Retrieve token
//     if (token == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('No token found. Please log in again.'),
//         ),
//       );
//       return;
//     }
//
//     // Parse the JWT token to get the payload
//     Map<String, dynamic> payload = Jwt.parseJwt('Bearer $userToken');
//     String? usernameFromToken = payload['username'];
//
//     final url = Uri.parse('http://10.177.240.103:8000/recognize/');
//     final request = http.MultipartRequest('POST', url);
//     request.headers['Authorization'] = token; // Add token to headers
//     request.files.add(
//       await http.MultipartFile.fromPath('image', _image!.path),
//     );
//
//     try {
//       final response = await request.send();
//       if (response.statusCode == 200) {
//         final recognizedName = await response.stream.bytesToString();
//
//         if (recognizedName == usernameFromToken) {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => QRScanPage()),
//           );
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text('Username does not match. Try again.'),
//             ),
//           );
//         }
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Failed to recognize face: ${response.reasonPhrase}'),
//           ),
//         );
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Error recognizing face: $e'),
//         ),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Face Recognition'),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) {
//                   return autho();
//                 },
//               ),
//             );
//           },
//         ),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             children: [
//               Container(
//                 width: double.infinity,
//                 height: 250,
//                 color: Colors.grey,
//                 child: Center(
//                   child: _image == null
//                       ? const Icon(
//                     Icons.add_a_photo,
//                     size: 60,
//                   )
//                       : Image.file(_image!),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               Container(
//                 width: double.infinity,
//                 height: 50,
//                 color: const Color.fromARGB(255, 7, 61, 105),
//                 child: MaterialButton(
//                   onPressed: () {
//                     _pickImage(ImageSource.camera);
//                   },
//                   child: const Text(
//                     'Take a photo',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 23,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               Container(
//                 width: double.infinity,
//                 height: 50,
//                 color: const Color.fromARGB(255, 7, 61, 105),
//                 child: MaterialButton(
//                   onPressed: _recognizeFace,
//                   child: const Text(
//                     'Recognize Face',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 23,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               if (_recognizedNames.isNotEmpty)
//                 Text(
//                   'Recognized Names: $_recognizedNames',
//                   style: const TextStyle(fontSize: 18),
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

//
//
// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:image_picker/image_picker.dart';
// import 'package:logaya/authorization.dart';
// import 'package:logaya/qr.dart';
// import 'core/helper/cach.dart';
// import 'core/network/end_points.dart';
//
// class FaceDetectionScreen extends StatefulWidget {
//   final String? username;
//
//   const FaceDetectionScreen({Key? key, this.username}) : super(key: key);
//
//   @override
//   _FaceDetectionScreenState createState() => _FaceDetectionScreenState();
// }
//
// class _FaceDetectionScreenState extends State<FaceDetectionScreen> {
//   File? _image;
//   String _recognizedNames = '';
//
//   @override
//   void initState() {
//     super.initState();
//     ChachHelper.init(); // Initialize shared preferences
//   }
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
//     final token = ChachHelper.getData(key:'Bearer $userToken'); // Retrieve token
//     if (token == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('No token found. Please log in again.'),
//         ),
//       );
//       return;
//     }
//
//     final url = Uri.parse('http://10.177.240.103:8000/recognize/');
//     final request = http.MultipartRequest('POST', url);
//     request.headers['Authorization'] = token; // Add token to headers
//     request.files.add(
//       await http.MultipartFile.fromPath('image', _image!.path),
//     );
//
//     try {
//       final response = await request.send();
//       if (response.statusCode == 200) {
//         final recognizedName = await response.stream.bytesToString();
//
//         if (recognizedName == widget.username) {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => QRScanPage()),
//           );
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text('Username does not match. Try again.'),
//             ),
//           );
//         }
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Failed to recognize face: ${response.reasonPhrase}'),
//           ),
//         );
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Error recognizing face: $e'),
//         ),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Face Recognition'),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) {
//                   return autho();
//                 },
//               ),
//             );
//           },
//         ),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             children: [
//               Container(
//                 width: double.infinity,
//                 height: 250,
//                 color: Colors.grey,
//                 child: Center(
//                   child: _image == null
//                       ? const Icon(
//                     Icons.add_a_photo,
//                     size: 60,
//                   )
//                       : Image.file(_image!),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               Container(
//                 width: double.infinity,
//                 height: 50,
//                 color: const Color.fromARGB(255, 7, 61, 105),
//                 child: MaterialButton(
//                   onPressed: () {
//                     _pickImage(ImageSource.camera);
//                   },
//                   child: const Text(
//                     'Take a photo',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 23,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               Container(
//                 width: double.infinity,
//                 height: 50,
//                 color: const Color.fromARGB(255, 7, 61, 105),
//                 child: MaterialButton(
//                   onPressed: _recognizeFace,
//                   child: const Text(
//                     'Recognize Face',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 23,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               if (_recognizedNames.isNotEmpty)
//                 Text(
//                   'Recognized Names: $_recognizedNames',
//                   style: const TextStyle(fontSize: 18),
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }




//}