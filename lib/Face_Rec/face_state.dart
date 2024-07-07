abstract class FaceDetectionState {}

class FaceDetectionInitial extends FaceDetectionState {}

class FaceDetectionLoading extends FaceDetectionState {}

class FaceDetectionImagePicked extends FaceDetectionState {}

class FaceDetectionSuccess extends FaceDetectionState {
  final String recognizedName;

  FaceDetectionSuccess(this.recognizedName);
}

class FaceDetectionError extends FaceDetectionState {
  final String error;

  FaceDetectionError(this.error);
}
