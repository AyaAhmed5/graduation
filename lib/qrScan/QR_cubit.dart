

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:logaya/qrScan/QR_state.dart';
//
// class Qrscan extends Cubit<QRState>

//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:logaya/core/network/end_points.dart';
// import 'package:logaya/qrScan/qr.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
//
// import '../core/helper/api.dart';
// import 'QR_state.dart';
//
// // Define the ScanCubit
// class ScanCubit extends Cubit<QRState> {
//   ScanCubit() : super(QRInitial());
//
//   static ScanCubit get(context) => BlocProvider.of(context);
//
//   void QRSCAN({required int lectureId}) {
//     scan scanModel;
//     emit(QRLoaded());
//     DioHelper().postData(
//         url: mark,
//         data: {
//           'lectureId': lectureId,
//
//         },
//         token: userToken
//     ).then((value) {
//       print(value.data);
//       scanModel = scan.fromJson(value.data);
//       emit(QRSuccess(scanModel));
//     }).catchError((onError) {
//       print(onError.toString());
//       emit(QRFailure(onError.toString()));
//     });
//   }
// }

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logaya/core/network/end_points.dart';

import 'package:logaya/qrScan/qr.dart';
import '../core/helper/api.dart';
import 'QR_state.dart';


class ScanCubit extends Cubit<QRState> {
  ScanCubit() : super(QRInitial());

  static ScanCubit get(context) => BlocProvider.of(context);

  void QRSCAN({required String lectureId}) {
    emit(QRLoaded());
    if (userToken != null) {
      DioHelper().postData(
        url: mark,
        data: {
          'lectureId': lectureId,
        },
        token: 'Bearer $userToken',
      ).then((value) {
        print(value.data);
        final scanModel = scan.fromJson(value.data);
        emit(QRSuccess(scanModel));
      }).catchError((onError) {
        print(onError.toString());
        emit(QRFailure(onError.toString()));
      });
    } else {
      emit(QRFailure('User token is not initialized'));
    }
  }
}

