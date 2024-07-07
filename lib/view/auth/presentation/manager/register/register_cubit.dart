// //
// // import 'package:bloc/bloc.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// //
// // import '../../../../../core/helper/api.dart';
// // import '../../../../../core/network/end_points.dart';
// // import '../../../../data/auth.dart';
// //
// // part 'register_state.dart';
// //
// // class RegisterCubit extends Cubit<RegisterState> {
// //   RegisterCubit() : super(RegisterInitial());
// //
// //   static RegisterCubit get(context) => BlocProvider.of(context);
// //   void userRegister({
// //     required String email,
// //     required String password,
// //     required String confirmPassword,
// //     required String firstName,
// //     required String lastName,
// //     required String userNameame,
// //   }) {
// //     Auth registerModel;
// //     emit(RegisterLoaded());
// //     DioHelper().postData(
// //       url: REGISTER,
// //       data: {
// //         'firstName': firstName,
// //         'lastName': lastName,
// //         'username': userNameame,
// //         'email': email,
// //         'password': password,
// //         'confirmPassword': confirmPassword,
// //       },
// //     ).then((value) {
// //       print(value.data);
// //       registerModel = Auth.fromJson(value.data);
// //       emit(RegisterSuccess(registerModel: registerModel));
// //     }).catchError((onError) {
// //       print(onError.toString());
// //       emit(RegisterFailure(onError.toString()));
// //     });
// //   }
// //
// //   bool isObsecure = true;
// //   IconData suffix = Icons.visibility_outlined;
// //
// //   void changePasswordVisibility() {
// //     isObsecure = !isObsecure;
// //     suffix =
// //         isObsecure ? Icons.visibility_outlined : Icons.visibility_off_outlined;
// //     emit(RegisterchangePasswordVisibility());
// //   }
// // }
//
//
// import 'package:bloc/bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../../../core/helper/api.dart';
// import '../../../../../core/network/end_points.dart';
// import '../../../../data/auth.dart';
//
// part 'register_state.dart';
//
// class RegisterCubit extends Cubit<RegisterState> {
//   RegisterCubit() : super(RegisterInitial());
//
//   static RegisterCubit get(context) => BlocProvider.of(context);
//   void userRegister({
//     required String email,
//     required String password,
//     required String confirmPassword,
//     required String firstName,
//     required String lastName,
//     required String userNameame,
//   }) {
//     Auth registerModel;
//     emit(RegisterLoaded());
//     DioHelper().postData(
//       url: REGISTER,
//       data: {
//         'firstName': firstName,
//         'lastName': lastName,
//         'username': userNameame,
//         'email': email,
//         'password': password,
//         'confirmPassword': confirmPassword,
//       },
//     ).then((value) {
//       print(value.data);
//       registerModel = Auth.fromJson(value.data);
//       emit(RegisterSuccess(registerModel: registerModel));
//     }).catchError((onError) {
//       print(onError.toString());
//       emit(RegisterFailure(onError.toString()));
//     });
//   }
//
//   bool isObsecure = true;
//   bool isConfirmObsecure = true;
//   IconData suffix = Icons.visibility_outlined;
//   IconData confirmSuffix = Icons.visibility_outlined;
//
//   void changePasswordVisibility() {
//     isObsecure = !isObsecure;
//     suffix = isObsecure ? Icons.visibility_outlined : Icons.visibility_off_outlined;
//     emit(RegisterchangePasswordVisibility());
//   }
//
//   void changeConfirmPasswordVisibility() {
//     isConfirmObsecure = !isConfirmObsecure;
//     confirmSuffix = isConfirmObsecure ? Icons.visibility_outlined : Icons.visibility_off_outlined;
//     emit(RegisterchangePasswordVisibility());
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:iconsax_flutter/iconsax_flutter.dart';
//
// i
// class RegisterScreen extends StatelessWidget {
//   RegisterScreen({super.key});
//   var emailController = TextEditingController();
//   var passWordController = TextEditingController();
//   var usernameController = TextEditingController();
//   var firstnameController = TextEditingController();
//   var lastnameController = TextEditingController();
//   var confirmPasswordController = TextEditingController();
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => RegisterCubit(),
//       child: BlocConsumer<RegisterCubit, RegisterState>(
//         listener: (context, state) {
//           if (state is RegisterSuccess) {
//             if (state.registerModel.isAuthenticated == true) {
//               ChachHelper.saveData(
//                   key: 'token', value: state.registerModel.token)
//                   .then((value) {
//                 userToken = '${state.registerModel.token}';
//                 Navigator.pushAndRemoveUntil(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => autho(),
//                   ),
//                       (route) => false,
//                 );
//               });
//               print('The Token is ${state.registerModel.token}');
//               showToast(msg: 'Success', state: ToastStates.SUCCESS);
//             } else {
//               showToast(msg: 'Failed', state: ToastStates.ERROR);
//             }
//           }
//         },
//         builder: (context, state) {
//           return Scaffold(
//             appBar: AppBar(),
//             body: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: SingleChildScrollView(
//                 child: Form(
//                   key: formKey,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Register',
//                         style: Theme.of(context).textTheme.headlineLarge,
//                       ),
//                       Text('Register now to browse our hot offers',
//                           style: Theme.of(context)
//                               .textTheme
//                               .bodySmall!
//                               .copyWith(color: Colors.grey)),
//                       const SizedBox(
//                         height: 30.0,
//                       ),
//                       CustomField(
//                         controller: firstnameController,
//                         lable: "First Name",
//                         onSubmitted: (value) {
//                           emailController.text = value;
//                         },
//                         icon: Iconsax.user,
//                         showBorder: false,
//                       ),
//                       CustomField(
//                         controller: lastnameController,
//                         lable: "Last Name",
//                         onSubmitted: (value) {
//                           emailController.text = value;
//                         },
//                         icon: Iconsax.user,
//                         showBorder: false,
//                       ),
//                       CustomField(
//                         controller: usernameController,
//                         lable: "user Name",
//                         onSubmitted: (value) {
//                           emailController.text = value;
//                         },
//                         icon: Iconsax.user,
//                         showBorder: false,
//                       ),
//                       CustomField(
//                         controller: emailController,
//                         lable: "Email",
//                         icon: Iconsax.direct,
//                         showBorder: false,
//                       ),
//                       CustomField(
//                         showBorder: false,
//                         obscure: RegisterCubit.get(context).isObsecure,
//                         controller: passWordController,
//                         lable: "Password",
//                         icon: Iconsax.lock,
//                         isPass: true,
//                         onSubmitted: (value) {
//                           passWordController.text = value;
//                         },
//                         suffixIcon: RegisterCubit.get(context).suffix,
//                         suffixPressed: () {
//                           RegisterCubit.get(context).changePasswordVisibility();
//                         },
//                       ),
//                       Text(
//                         'Hint: Use at least 8 characters, including uppercase letters, lowercase letters, numbers, and symbols.',
//                         style: TextStyle(
//                           color: Colors.grey,
//                           fontSize: 12,
//                         ),
//                       ),
//                       CustomField(
//                         controller: confirmPasswordController,
//                         obscure: RegisterCubit.get(context).isConfirmObsecure,
//                         lable: "Confirm Password",
//                         icon: Icons.lock,
//                         showBorder: false,
//                         suffixIcon: RegisterCubit.get(context).confirmSuffix,
//                         suffixPressed: () {
//                           RegisterCubit.get(context).changeConfirmPasswordVisibility();
//                         },
//                         validator: (value) {
//                           if (value != passWordController.text) {
//                             return 'Passwords do not match';
//                           }
//                           return null;
//                         },
//                       ),
//                       const SizedBox(
//                         height: 30.0,
//                       ),
//                       state is RegisterLoaded
//                           ? const Center(
//                         child: CircularProgressIndicator(),
//                       )
//                           : CustomButton(
//                         text: 'Register'.toUpperCase(),
//                         color: mainColor,
//                         textcolor: Colors.black,
//                         circular: 10.0,
//                         onTap: () {
//                           if (formKey.currentState!.validate()) {
//                             RegisterCubit.get(context).userRegister(
//                                 firstName: firstnameController.text,
//                                 lastName: lastnameController.text,
//                                 userNameame: usernameController.text,
//                                 confirmPassword:
//                                 confirmPasswordController.text,
//                                 email: emailController.text,
//                                 password: passWordController.text);
//                           }
//                         },
//                       ),
//                       const SizedBox(
//                         height: 15.0,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
// import 'package:bloc/bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../../../core/helper/api.dart';
// import '../../../../../core/network/end_points.dart';
// import '../../../../data/auth.dart';
//
// part 'register_state.dart';
//
// class RegisterCubit extends Cubit<RegisterState> {
//   RegisterCubit() : super(RegisterInitial());
//
//   static RegisterCubit get(context) => BlocProvider.of(context);
//   void userRegister({
//     required String email,
//     required String password,
//     required String confirmPassword,
//     required String firstName,
//     required String lastName,
//     required String userNameame,
//   }) {
//     Auth registerModel;
//     emit(RegisterLoaded());
//     DioHelper().postData(
//       url: REGISTER,
//       data: {
//         'firstName': firstName,
//         'lastName': lastName,
//         'username': userNameame,
//         'email': email,
//         'password': password,
//         'confirmPassword': confirmPassword,
//       },
//     ).then((value) {
//       print(value.data);
//       registerModel = Auth.fromJson(value.data);
//       emit(RegisterSuccess(registerModel: registerModel));
//     }).catchError((onError) {
//       print(onError.toString());
//       emit(RegisterFailure(onError.toString()));
//     });
//   }
//
//   bool isObsecure = true;
//   IconData suffix = Icons.visibility_outlined;
//
//   void changePasswordVisibility() {
//     isObsecure = !isObsecure;
//     suffix =
//         isObsecure ? Icons.visibility_outlined : Icons.visibility_off_outlined;
//     emit(RegisterchangePasswordVisibility());
//   }
// }

//
// import 'package:bloc/bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../../../core/helper/api.dart';
// import '../../../../../core/network/end_points.dart';
// import '../../../../data/auth.dart';
//
// part 'register_state.dart';
//
// class RegisterCubit extends Cubit<RegisterState> {
//   RegisterCubit() : super(RegisterInitial());
//
//   static RegisterCubit get(context) => BlocProvider.of(context);
//   void userRegister({
//     required String email,
//     required String password,
//     required String confirmPassword,
//     required String firstName,
//     required String lastName,
//     required String userNameame,
//   }) {
//     Auth registerModel;
//     emit(RegisterLoaded());
//     DioHelper().postData(
//       url: REGISTER,
//       data: {
//         'firstName': firstName,
//         'lastName': lastName,
//         'username': userNameame,
//         'email': email,
//         'password': password,
//         'confirmPassword': confirmPassword,
//       },
//     ).then((value) {
//       print(value.data);
//       registerModel = Auth.fromJson(value.data);
//       emit(RegisterSuccess(registerModel: registerModel));
//     }).catchError((onError) {
//       print(onError.toString());
//       emit(RegisterFailure(onError.toString()));
//     });
//   }
//
//   bool isObsecure = true;
//   IconData suffix = Icons.visibility_outlined;
//
//   void changePasswordVisibility() {
//     isObsecure = !isObsecure;
//     suffix =
//     isObsecure ? Icons.visibility_outlined : Icons.visibility_off_outlined;
//     emit(RegisterchangePasswordVisibility());
//   }
// }



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
  bool isConfirmObsecure = true;
  IconData suffix = Icons.visibility_outlined;
  IconData confirmSuffix = Icons.visibility_outlined;

  void changePasswordVisibility() {
    isObsecure = !isObsecure;
    suffix = isObsecure ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(RegisterchangePasswordVisibility());
  }

  void changeConfirmPasswordVisibility() {
    isConfirmObsecure = !isConfirmObsecure;
    confirmSuffix = isConfirmObsecure ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(RegisterchangePasswordVisibility());
  }
}