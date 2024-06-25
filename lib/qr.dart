// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
// import 'core/helper/api.dart';
// import 'core/network/end_points.dart';
//
//
// class QRScanPage extends StatefulWidget {
//   const QRScanPage({Key? key}) : super(key: key);
//
//   @override
//   State<QRScanPage> createState() => _QRScanPageState();
// }
//
// class _QRScanPageState extends State<QRScanPage> {
//   final GlobalKey _gLobalkey = GlobalKey();
//   QRViewController? controller;
//   Barcode? result;
//
//   void qr(QRViewController controller) {
//     this.controller = controller;
//     controller.scannedDataStream.listen((event) {
//       setState(() {
//         result = event;
//         // Close the camera after scanning
//         controller.dispose();
//         // Send the result to the backend with the token
//         _sendQRCodeToBackend(result?.code ?? "No QR Code found", userToken!);
//       });
//     });
//   }
//
//   void _sendQRCodeToBackend(String qrCode, String token) async {
//     try {
//       final response = await DioHelper().postData(
//         url: 'http://yasmeen84983.runasp.net/api/Attendance/MarkAttendance', // The endpoint for attendance
//         data: {'qr_code': qrCode},
//         token: token, // Pass the token here
//       );
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => ResultPage(response.data['message']),
//         ),
//       );
//     } catch (e) {
//       // Handle errors if necessary
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => ResultPage("Error: ${e.toString()}"),
//         ),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("QR"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Container(
//               height: 400,
//               width: 400,
//               child: QRView(
//                 key: _gLobalkey,
//                 onQRViewCreated: qr,
//               ),
//             ),
//             Center(
//               child: (result != null) ? Text('${result!.code}') : Text('Scan a code'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class ResultPage extends StatelessWidget {
//   final String resultMessage;
//
//   const ResultPage(this.resultMessage);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("QR Result"),
//         ),
//         body: Center(
//             child: Text('QR Code Result: $resultMessage'),
//             ),
//         );
//    }
// }
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'core/helper/api.dart';
// import 'core/network/end_points.dart';
//
// class QRScanPage extends StatefulWidget {
//   const QRScanPage({Key? key}) : super(key: key);
//
//   @override
//   State<QRScanPage> createState() => _QRScanPageState();
// }
//
// class _QRScanPageState extends State<QRScanPage> {
//   final GlobalKey _gLobalkey = GlobalKey();
//   QRViewController? controller;
//   Barcode? result;
//   String? userToken;
//
//   // Create a FlutterSecureStorage instance
//   final FlutterSecureStorage secureStorage = FlutterSecureStorage();
//
//   @override
//   void initState() {
//     super.initState();
//     _loadToken();
//   }
//
//   Future<void> _loadToken() async {
//     userToken = await secureStorage.read(key: 'userToken');
//     if (userToken == null) {
//       // Handle the case where the token is not available
//       print('User token is not available.');
//     }
//   }
//
//   void qr(QRViewController controller) {
//     this.controller = controller;
//     controller.scannedDataStream.listen((event) {
//       setState(() {
//         result = event;
//         // Close the camera after scanning
//         controller.dispose();
//         // Send the result to the backend with the token
//         if (userToken != null) {
//           _sendQRCodeToBackend(result?.code ?? "No QR Code found", userToken!);
//         } else {
//           print('User token is not available.');
//         }
//       });
//     });
//   }
//
//   void _sendQRCodeToBackend(String qrCode, String token) async {
//     try {
//       DioHelper.setToken(token); // Ensure token is set in DioHelper
//       final response = await DioHelper().postData(
//         url: 'http://yasmeen84983.runasp.net/api/Attendance/MarkAttendance', // The endpoint for attendance
//         data: {'qr_code': qrCode},
//       );
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => ResultPage(response.data['message']),
//         ),
//       );
//     } catch (e) {
//       // Handle errors if necessary
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => ResultPage("Error: ${e.toString()}"),
//         ),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("QR"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Container(
//               height: 400,
//               width: 400,
//               child: QRView(
//                 key: _gLobalkey,
//                 onQRViewCreated: qr,
//               ),
//             ),
//             Center(
//               child: (result != null) ? Text('${result!.code}') : Text('Scan a code'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class ResultPage extends StatelessWidget {
//   final String resultMessage;
//
//   const ResultPage(this.resultMessage);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("QR Result"),
//       ),
//       body: Center(
//         child: Text('QR Code Result: $resultMessage'),
//       ),
//     );
//   }
// }
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
//
//
//
// class QRScanPage extends StatefulWidget {
//   const QRScanPage({Key? key}) : super(key: key);
//
//   @override
//   State<QRScanPage> createState() => _QRScanPageState();
// }
//
// class _QRScanPageState extends State<QRScanPage> {
//   final GlobalKey _gLobalkey = GlobalKey();
//   QRViewController? controller;
//   Barcode? result;
//
//   void qr(QRViewController controller) {
//     this.controller = controller;
//     controller.scannedDataStream.listen((event) {
//       setState(() {
//         result = event;
//         // Close the camera after scanning
//         controller.dispose();
//
//         // Navigate to another page with the result
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => ResultPage(result?.code ?? "No QR Code found"),
//           ),
//         );
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("QR"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Container(
//               height: 400,
//               width: 400,
//               child: QRView(
//                 key: _gLobalkey,
//                 onQRViewCreated: qr,
//               ),
//             ),
//             Center(
//               child: (result != null) ? Text('${result!.code}') : Text('Scan a code'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class ResultPage extends StatelessWidget {
//   final String qrCodeResult;
//
//   const ResultPage(this.qrCodeResult);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("QR Result"),
//       ),
//       body: Center(
//         child: Text('QR Code Result: $qrCodeResult'),
//       ),
//     );
//   }
// }
//
//
//
//
//
//
//
//
//
//
//
//
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:logaya/qrScan/QR_cubit.dart';
// import 'package:logaya/qrScan/QR_state.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
//
// import 'core/helper/cach.dart';
// import 'core/widget/custom_show_toast.dart';
//
//
//
// class QRScanPage extends StatefulWidget {
//   const QRScanPage({Key? key}) : super(key: key);
//
//   @override
//   State<QRScanPage> createState() => _QRScanPageState();
// }
//
// class _QRScanPageState extends State<QRScanPage> {
//   final GlobalKey _gLobalkey = GlobalKey();
//   QRViewController? controller;
//   Barcode? result;
//
//   void qr(QRViewController controller) {
//     this.controller = controller;
//     controller.scannedDataStream.listen((event) {
//       setState(() {
//         result = event;
//         // Close the camera after scanning
//         controller.dispose();
//
//         // Navigate to another page with the result
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => ResultPage(result?.code ?? "No QR Code found"),
//           ),
//         );
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//         create: (context) => ScanCubit(),
//         child: BlocConsumer<ScanCubit, QRState>(
//         listener: (context, state) {
//       if (state is QRSuccess) {
//         if (state.QRModel.isAuthenticated == true) {
//           ChachHelper.saveData(
//               key: 'token', value: state.registerModel.token)
//               .then((value) {
//             userToken = '${state.registerModel.token}';
//             Navigator.pushAndRemoveUntil(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => Container(),
//               ),
//                   (route) => false,
//             );
//           });
//           // print('The Token is ${state.QRModel.token}');
//           showToast(msg: 'Success', state: ToastStates.SUCCESS);
//         } else {
//           showToast(msg: 'Failed', state: ToastStates.ERROR);
//         }
//       }
//     },
//     builder: (context, state) {
//           return   Scaffold(
//       appBar: AppBar(
//         title: Text("QR"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Container(
//               height: 400,
//               width: 400,
//               child: QRView(
//                 key: _gLobalkey,
//                 onQRViewCreated: qr,
//               ),
//             ),
//             Center(
//               child: (result != null) ? Text('${result!.code}') : Text('Scan a code'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// }
//
// class ResultPage extends StatelessWidget {
//   final String qrCodeResult;
//
//   const ResultPage(this.qrCodeResult);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("QR Result"),
//       ),
//       body: Center(
//         child: Text('QR Code Result: $qrCodeResult'),
//       ),
//     );
//   }
// }
// qr_scan_page.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logaya/core/network/end_points.dart';
import 'package:logaya/qrScan/QR_cubit.dart';
import 'package:logaya/qrScan/QR_state.dart';
import 'package:logaya/scan.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'ViewAttend/table.dart';
import 'core/widget/custom_show_toast.dart';

// class QRScanPage extends StatefulWidget {
//   const QRScanPage({Key? key}) : super(key: key);
//
//   @override
//   State<QRScanPage> createState() => _QRScanPageState();
// }
//
// class _QRScanPageState extends State<QRScanPage> with WidgetsBindingObserver {
//   final GlobalKey _globalKey = GlobalKey();
//   QRViewController? controller;
//   Barcode? result;
//
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addObserver(this);
//   }
//
//   @override
//   void dispose() {
//     WidgetsBinding.instance.removeObserver(this);
//     controller?.dispose();
//     super.dispose();
//   }
//
//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     if (controller != null) {
//       if (state == AppLifecycleState.paused) {
//         controller?.pauseCamera();
//       } else if (state == AppLifecycleState.resumed) {
//         controller?.resumeCamera();
//       }
//     }
//   }
//
//   void onQRViewCreated(QRViewController controller) {
//     this.controller = controller;
//     controller.scannedDataStream.listen((event) {
//       setState(() {
//         result = event;
//         if (result != null) {
//           String lectureId = result!.code!;
//           BlocProvider.of<ScanCubit>(context).QRSCAN(lectureId: lectureId);
//         }
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => ScanCubit(),
//       child: BlocConsumer<ScanCubit, QRState>(
//         listener: (context, state) {
//           if (state is QRSuccess) {
//             showToast(msg: 'QR Code processed successfully', state: ToastStates.SUCCESS);
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => ResultPage(state.QRModel.lectureId.toString()),
//               ),
//             );
//           } else if (state is QRFailure) {
//             showToast(msg: state.errMessage, state: ToastStates.ERROR);
//           }
//         },
//         builder: (context, state) {
//           return Scaffold(
//             appBar: AppBar(
//               title: Text("QR Scanner"),
//             ),
//             body: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Container(
//                     height: 400,
//                     width: 400,
//                     child: QRView(
//                       key: _globalKey,
//                       onQRViewCreated: onQRViewCreated,
//                     ),
//                   ),
//                   Center(
//                     child: (result != null) ? Text('${result!.code}') : Text('Scan a code'),
//                   ),
//                   if (state is QRLoaded)
//                     CircularProgressIndicator(),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

//
// class QRScanPage extends StatefulWidget {
//   const QRScanPage({Key? key}) : super(key: key);
//
//   @override
//   State<QRScanPage> createState() => _QRScanPageState();
// }
//
// class _QRScanPageState extends State<QRScanPage> with WidgetsBindingObserver {
//   final GlobalKey _globalKey = GlobalKey();
//   QRViewController? controller;
//   Barcode? result;
//
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addObserver(this);
//   }
//
//   @override
//   void dispose() {
//     WidgetsBinding.instance.removeObserver(this);
//     controller?.dispose();
//     super.dispose();
//   }
//
//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     if (controller != null) {
//       if (state == AppLifecycleState.paused) {
//         controller?.pauseCamera();
//       } else if (state == AppLifecycleState.resumed) {
//         controller?.resumeCamera();
//       }
//     }
//   }
//
//   void onQRViewCreated(QRViewController controller) {
//     this.controller = controller;
//     controller.scannedDataStream.listen((event) {
//       setState(() {
//         result = event;
//         if (result != null) {
//           String lectureId = result!.code!;
//           controller.pauseCamera(); // Pause the camera
//           BlocProvider.of<ScanCubit>(context).QRSCAN(lectureId: lectureId);
//         }
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => ScanCubit(),
//       child: BlocConsumer<ScanCubit, QRState>(
//         listener: (context, state) async {
//           if (state is QRSuccess) {
//             await controller?.stopCamera(); // Ensure the camera is stopped
//             showToast(msg: 'QR Code processed successfully', state: ToastStates.SUCCESS);
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => ResultPage(state.QRModel.lectureId.toString()),
//               ),
//             );
//           } else if (state is QRFailure) {
//             showToast(msg: state.errMessage, state: ToastStates.ERROR);
//           }
//         },
//         builder: (context, state) {
//           return Scaffold(
//             appBar: AppBar(
//               title: Text("QR Scanner"),
//             ),
//             body: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Container(
//                     height: 400,
//                     width: 400,
//                     child: QRView(
//                       key: _globalKey,
//                       onQRViewCreated: onQRViewCreated,
//                     ),
//                   ),
//                   Center(
//                     child: (result != null) ? Text('${result!.code}') : Text('Scan a code'),
//                   ),
//                   if (state is QRLoaded)
//                     CircularProgressIndicator(),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

class QRScanPage extends StatefulWidget {
  const QRScanPage({Key? key}) : super(key: key);

  @override
  State<QRScanPage> createState() => _QRScanPageState();
}

class _QRScanPageState extends State<QRScanPage> with WidgetsBindingObserver {
  final GlobalKey _globalKey = GlobalKey();
  QRViewController? controller;
  Barcode? result;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    controller?.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (controller != null) {
      if (state == AppLifecycleState.paused) {
        controller?.pauseCamera();
      } else if (state == AppLifecycleState.resumed) {
        controller?.resumeCamera();
      }
    }
  }

  // void onQRViewCreated(QRViewController controller) {
  //   this.controller = controller;
  //   controller.scannedDataStream.listen((event) {
  //     setState(() {
  //       result = event;
  //       if (result != null) {
  //         String lectureId = result!.code!;
  //         controller.pauseCamera(); // Pause the camera
  //         BlocProvider.of<ScanCubit>(context).QRSCAN(lectureId: lectureId);
  //       }
  //     });
  //   });
  // }

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((event) {
      setState(() {
        result = event;
        if (result != null) {
          String lectureId = result!.code!;
          controller.pauseCamera(); // Pause the camera
          BlocProvider.of<ScanCubit>(context).QRSCAN(lectureId: lectureId);

          // Navigate to the view page
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>StudentAttendanceScreen(token: '$userToken',),
            ),
          );
        }
      });
    });
  }



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ScanCubit(),
      child: BlocConsumer<ScanCubit, QRState>(
        listener: (context, state) async {
          if (state is QRSuccess) {
       await controller?.stopCamera(); // Ensure the camera is stopped
            showToast(msg: 'QR Code processed successfully', state: ToastStates.SUCCESS);
            print('Navigating to StudentAttendanceScreen with token: ${state.QRModel.lectureId.toString()}');
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => StudentAttendanceScreen(token: state.QRModel.lectureId.toString()), // Pass the token here
              ),
            );
          } else if (state is QRFailure) {
            showToast(msg: state.errMessage, state: ToastStates.ERROR);
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text("QR Scanner"),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 400,
                    width: 400,
                    child: QRView(
                      key: _globalKey,
                      onQRViewCreated: onQRViewCreated,
                    ),
                  ),
                  Center(
                    child: (result != null) ? Text('${result!.code}') : Text('Scan a code'),
                  ),
                  if (state is QRLoaded)
                    CircularProgressIndicator(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}