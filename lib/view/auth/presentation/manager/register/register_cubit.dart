
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helper/api.dart';
import '../../../../../core/network/end_points.dart';
import '../../../../data/auth.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);
  void userRegister({
    required String email,
    required String password,
    required String confirmPassword,
    required String firstName,
    required String lastName,
    required String userNameame,
  }) {
    Auth registerModel;
    emit(RegisterLoaded());
    DioHelper().postData(
      url: REGISTER,
      data: {
        'firstName': firstName,
        'lastName': lastName,
        'username': userNameame,
        'email': email,
        'password': password,
        'confirmPassword': confirmPassword,
      },
    ).then((value) {
      print(value.data);
      registerModel = Auth.fromJson(value.data);
      emit(RegisterSuccess(registerModel: registerModel));
    }).catchError((onError) {
      print(onError.toString());
      emit(RegisterFailure(onError.toString()));
    });
  }

  bool isObsecure = true;
  IconData suffix = Icons.visibility_outlined;

  void changePasswordVisibility() {
    isObsecure = !isObsecure;
    suffix =
        isObsecure ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(RegisterchangePasswordVisibility());
  }
}
