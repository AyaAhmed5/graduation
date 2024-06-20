// // //
// // //
// // // import 'package:flutter/cupertino.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
// // //
// // // class QRpage extends StatefulWidget {
// // //   QRpage({Key? key}) : super(key: key);
// // //
// // //   @override
// // //   State<QRpage> createState() => _QrPageState();
// // // }
// // //
// // // class _QrPageState extends State<QRpage> {
// // //   var qrstr = "let's Scan it";
// // //
// // //   var height, width;
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     height = MediaQuery
// // //         .of(context)
// // //         .size
// // //         .height;
// // //     width = MediaQuery
// // //         .of(context)
// // //         .size
// // //         .width;
// // //     return Scaffold(
// // //         backgroundColor: Color.fromARGB(255, 161, 185, 210),
// // //         appBar: AppBar(
// // //           title: Text('QR Code'),
// // //         ),
// // //         body: Container(
// // //           child: SingleChildScrollView(
// // //             child: Padding(
// // //               padding: const EdgeInsets.all(20.0),
// // //               child: Center(
// // //                 child: Column(
// // //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// // //                   crossAxisAlignment: CrossAxisAlignment.center,
// // //                   children: [
// // //                     Positioned(
// // //                       child: Image.asset(
// // //                         "assets/images/"
// // //                             "Scan_Me_SVG_Bundle_Frame_QR_Code_Svg_Cricut_Icon_Cut_Files_Border_QR_Code_Silhouette_Tag_Clipart_Pay_flrkct.webp",
// // //                         width: 250,
// // //                       ),
// // //                     ),
// // //                     SizedBox(
// // //                       height: 50,
// // //                     ),
// // //                     SizedBox(
// // //                       height: 50,
// // //                     ),
// // //                     ElevatedButton(
// // //                         style: ElevatedButton.styleFrom(
// // //                             primary: Color.fromARGB(255, 101, 148, 184),
// // //                             minimumSize: Size(150, 50)),
// // //                         onPressed: scanQr,
// // //                         child: Text(('Scanner now'))),
// // //                     SizedBox(
// // //                       height: 60,
// // //                     ),
// // //                     ElevatedButton(
// // //                       style: ElevatedButton.styleFrom(
// // //                           primary: Color.fromARGB(255, 101, 148, 184),
// // //                           minimumSize: Size(150, 50)),
// // //                       onPressed: () {
// // //                         Navigator.pushNamed(context,  "/autho");
// // //                       },
// // //                       child: Text("cancle"),
// // //                     )
// // //                   ],
// // //                 ),
// // //               ),
// // //             ),
// // //           ),
// // //         ));
// // //   }
// // //
// // //   Future<void> scanQr() async {
// // //     try {
// // //       FlutterBarcodeScanner.scanBarcode('#838a8f', 'cancel', true, ScanMode.QR)
// // //           .then((value) {
// // //         setState(() {
// // //           qrstr = value;
// // //         });
// // //       });
// // //     } catch (e) {
// // //       setState(() {
// // //         qrstr = 'unable to read this';
// // //
// // //       });
// // //
// // //   }
// // //
// // //   }
// // // }
// //
// //
// //

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';



class QRScanPage extends StatefulWidget {
  const QRScanPage({Key? key}) : super(key: key);

  @override
  State<QRScanPage> createState() => _QRScanPageState();
}

class _QRScanPageState extends State<QRScanPage> {
  final GlobalKey _gLobalkey = GlobalKey();
  QRViewController? controller;
  Barcode? result;

  void qr(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((event) {
      setState(() {
        result = event;
        // Close the camera after scanning
        controller.dispose();

        // Navigate to another page with the result
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultPage(result?.code ?? "No QR Code found"),
          ),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 400,
              width: 400,
              child: QRView(
                key: _gLobalkey,
                onQRViewCreated: qr,
              ),
            ),
            Center(
              child: (result != null) ? Text('${result!.code}') : Text('Scan a code'),
            ),
          ],
        ),
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  final String qrCodeResult;

  const ResultPage(this.qrCodeResult);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Result"),
      ),
      body: Center(
        child: Text('QR Code Result: $qrCodeResult'),
      ),
    );
  }
}



