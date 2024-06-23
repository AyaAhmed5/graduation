//
// import 'package:logaya/qrScan/qr.dart';
//
//
//
// sealed class QRState {}
//
// final class QRInitial extends QRState {}
//
// final class QRLoaded extends QRState {}
//
// final class QRSuccess extends QRState {
// final scan QRModel;
//
// QRSuccess(this.QRModel);
// }
//
// final class QRFailure extends QRState {
// final String errMessage;
//
// QRFailure(this.errMessage);
// }
//
// final class QRchangePasswordVisibility extends QRState {}


import 'package:logaya/qrScan/qr.dart';



sealed class QRState {}

final class QRInitial extends QRState {}

final class QRLoaded extends QRState {}

final class QRSuccess extends QRState {
final scan QRModel;

QRSuccess(this.QRModel);
}

final class QRFailure extends QRState {
final String errMessage;

QRFailure(this.errMessage);
}

final class QRchangePasswordVisibility extends QRState {}
