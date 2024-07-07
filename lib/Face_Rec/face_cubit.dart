import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logaya/qr.dart';
import '../core/helper/cach.dart';
import '../core/network/end_points.dart';
import 'face_state.dart';

class FaceDetectionCubit extends Cubit<FaceDetectionState> {
  FaceDetectionCubit() : super(FaceDetectionInitial());

  static FaceDetectionCubit get(context) => BlocProvider.of(context);

  File? _image;

  File? get image => _image;

  Future<void> pickImage(ImageSource source) async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: source);
      if (pickedFile == null) return;
      _image = File(pickedFile.path);
      emit(FaceDetectionImagePicked());
    } catch (e) {
      emit(FaceDetectionError('Error picking image: $e'));
    }
  }

  Future<void> recognizeFace() async {
    if (_image == null) return;
    emit(FaceDetectionLoading());

    final token = ChachHelper.getData(key: 'Bearer $userToken');
    if (token == null) {
      emit(FaceDetectionError('No token found. Please log in again.'));
      return;
    }

    Map<String, dynamic> payload = Jwt.parseJwt(token);
    String? usernameFromToken = payload['username'];

    Dio dio = Dio();
    dio.options.headers['Authorization'] = token; // Add token to headers

    FormData formData = FormData.fromMap({
      'image': await MultipartFile.fromFile(_image!.path),
    });

    try {
      final response = await dio.post(
        'http://10.177.240.103:8000/recognize/',
        data: formData,
      );

      if (response.statusCode == 200) {
        final recognizedName = response.data.toString();

        if (recognizedName == usernameFromToken) {
          emit(FaceDetectionSuccess(recognizedName));
        } else {
          emit(FaceDetectionError('Username does not match. Try again.'));
        }
      } else {
        emit(FaceDetectionError('Failed to recognize face: ${response.statusMessage}'));
      }
    } catch (e) {
      emit(FaceDetectionError('Error recognizing face: $e'));
    }
  }
}
