// // //
// // // import 'package:flutter/cupertino.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
// // //
// // // class ScanScreen extends StatefulWidget {
// // //   @override
// // //   _ScanScreenState createState() => _ScanScreenState();
// // // }
// // //
// // // class _ScanScreenState extends State<ScanScreen> {
// // //   var qrstr = "let's Scan it";
// // //   var height,width;
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //
// // //     height = MediaQuery
// // //         .of(context)
// // //         .size
// // //         .height;
// // //     width = MediaQuery
// // //         .of(context)
// // //         .size
// // //         .width;
// // //     return Scaffold(
// // //         appBar: AppBar(
// // //           title: Text('Scanning QR code'),
// // //         ),
// // //         body: Center(
// // //           child: Column(
// // //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// // //             crossAxisAlignment: CrossAxisAlignment.center,
// // //             children: [
// // //               Text(qrstr,style: TextStyle(color: Colors.blue,fontSize: 30),),
// // //               ElevatedButton(onPressed: scanQr, child:
// // //               Text(('Scanner'))),
// // //               SizedBox(height: width,)
// // //             ],
// // //           ),
// // //         )
// // //     );
// // //   }
// // //
// // //
// // //   Future <void>scanQr()async{
// // //     try{
// // //       FlutterBarcodeScanner.scanBarcode('#2A99CF', 'cancel', true, ScanMode.QR).then((value){
// // //         setState(() {
// // //           qrstr=value;
// // //         });
// // //       });
// // //     }catch(e){
// // //       setState(() {
// // //         qrstr='unable to read this';
// // //       });
// // //     }
// // //   }
// // // }
// //
// //
// //
// import 'package:barcode_widget/barcode_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
//
// class ScanScreen extends StatefulWidget {
//   @override
//   _ScanScreenState createState() => _ScanScreenState();
// }
//
// class _ScanScreenState extends State<ScanScreen> {
//   var qrstr = "let's Scan it";
//   var height,width;
//
//   @override
//   Widget build(BuildContext context) {
//
//     height = MediaQuery
//         .of(context)
//         .size
//         .height;
//     width = MediaQuery
//         .of(context)
//         .size
//         .width;
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Scanning QR code'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text(qrstr,style: TextStyle(color: Colors.blue,fontSize: 30),),
//               ElevatedButton(onPressed: scanQr, child:
//               Text(('Scanner'))),
//               SizedBox(height: width,)
//             ],
//           ),
//         )
//     );
//   }
//
//
//   Future <void>scanQr()async{
//     try{
//       FlutterBarcodeScanner.scanBarcode('#2A99CF', 'cancel', true, ScanMode.QR).then((value){
//         setState(() {
//           qrstr=value;
//         });
//       });
//     }catch(e){
//       setState(() {
//         qrstr='unable to read this';
//       });
//     }
//   }
// }
//
//
//
//

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
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
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
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






import 'package:flutter/material.dart';


class ResultPage extends StatelessWidget {
  final String lectureId;

  ResultPage(this.lectureId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Success'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 100.0,
            ),
            SizedBox(height: 20),
            Text(
              'QR Code processed successfully',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              'Lecture ID: $lectureId',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}



