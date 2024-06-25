//
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../core/helper/api.dart';
// import '../core/network/end_points.dart';
// import 'AttendModel.dart';
// import 'View_state.dart';
//
// class ViewAttendCubit extends Cubit<ViewAttendState> {
//   ViewAttendCubit() : super(AttendInitial());
//   static ViewAttendCubit get(context) => BlocProvider.of(context);
//   List<ViewAttendence> viewModels = [];
//
//   void getStudents() {
//     emit(AttendLoadingState());
//     DioHelper().getData(url: view).then((value) {
//       viewModels = (value.data as List).map((student) => ViewAttendence.fromJson(student)).toList();
//
//       print(viewModels.toString());
//       emit(AttendSuccessState(viewModels: viewModels));
//     }).catchError((onError) {
//       emit(AttendErrorState(onError.toString()));
//       print(onError.toString());
//      });
//   }
//
// }

//
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../core/helper/api.dart';
// import '../core/network/end_points.dart';
// import 'AttendModel.dart';
// import 'View_state.dart';
//
// class ViewAttendCubit extends Cubit<ViewAttendState> {
//   ViewAttendCubit() : super(AttendInitial());
//
//   static ViewAttendCubit get(context) => BlocProvider.of(context);
//
//   List<ViewAttendence> viewModels = [];
//
//   void getstudents(String token) {
//     emit(AttendLoadingState());
//     DioHelper().getData(url: view).then((value) {
//       viewModels = (value.data as List).map((attendance) => ViewAttendence.fromJson(attendance)).toList();
//
//       // Print course names in the terminal
//       // viewModels.forEach((attendance) {
//       //   print('Course Name: ${attendance.courseName}');
//       // });
//       print("coures name=${viewModels.toString()}");
//       token: 'Bearer $userToken';
//       emit(AttendSuccessState(viewModels: viewModels));
//     }).catchError((error) {
//       emit(AttendErrorState(error.toString()));
//       print('Error: $error');
//     });
//   }
// }



import 'package:flutter_bloc/flutter_bloc.dart';
import '../core/helper/api.dart';
import '../core/network/end_points.dart';
import 'AttendModel.dart';
import 'View_state.dart';

class ViewAttendCubit extends Cubit<ViewAttendState> {
  ViewAttendCubit() : super(AttendInitial());

  static ViewAttendCubit get(context) => BlocProvider.of(context);

  List<ViewAttendence> viewModels = [];

  void getstudents(String token) {
    emit(AttendLoadingState());
    DioHelper().getData(
      url: view,
      token: 'Bearer $token',
    ).then((value) {
//       viewModels = (value.data as List)
//           .map((attendance) => ViewAttendence.fromJson(attendance))
//           .toList();
//
//       print("Course names=${viewModels.toString()}");
//       emit(AttendSuccessState(viewModels: viewModels));
//     }).catchError((error) {
//       emit(AttendErrorState(error.toString()));
//       print('Error: $error');
//     });
//   }
// }


      print("Raw API response: ${value.data}"); // Debugging statement
      viewModels = (value.data as List)
          .map((attendance) => ViewAttendence.fromJson(attendance))
          .toList();

      print("Course names=${viewModels.toString()}");
      emit(AttendSuccessState(viewModels: viewModels));
    }).catchError((error) {
      emit(AttendErrorState(error.toString()));
      print('Error: $error');
    });
  }
}