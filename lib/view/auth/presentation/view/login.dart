//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:iconsax_flutter/iconsax_flutter.dart';
// import 'package:logaya/authorization.dart';
// import 'package:logaya/view/auth/presentation/view/register.dart';
// import 'package:logaya/view/auth/presentation/view/widgets/text_field.dart';
//
// import '../../../../core/helper/cach.dart';
// import '../../../../core/network/end_points.dart';
// import '../../../../core/widget/colors.dart';
// import '../../../../core/widget/custom_button.dart';
// import '../../../../core/widget/custom_show_toast.dart';
// import '../manager/login/login_cubit.dart';
// import '../manager/login/login_state.dart';
//
// class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//     var emailController = TextEditingController();
//     var passWordController = TextEditingController();
//
//     return BlocProvider(
//       create: (context) => LoginCubit(),
//       child: BlocConsumer<LoginCubit, LoginState>(
//         listener: (context, state) {
//           if (state is LoginSuccess) {
//             if (state.loginModel.isAuthenticated == true) {
//               ChachHelper.saveData(
//                       key: 'token', value: state.loginModel.token)
//                   .then(
//                 (value) {
//                   userToken = '${state.loginModel.token}';
//                   Navigator.pushAndRemoveUntil(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) =>  autho(),
//                     ),
//                     (route) => false,
//                   );
//                 },
//               );
//               showToast(
//                   msg: 'Success', state: ToastStates.SUCCESS);
//             } else {
//               showToast(
//                   msg: 'Failed', state: ToastStates.ERROR);
//             }
//           }
//         },
//         builder: (context, state) {
//           return Scaffold(
//        //    backgroundColor: Color(0xff005f6a),
//             appBar: AppBar(),
//             body: Padding(
//               padding: const EdgeInsets.all(20.0),
//
//               child: SingleChildScrollView(
//                 child: Form(
//                   key: formKey,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Login',
//                         style: Theme.of(context).textTheme.headlineLarge,
//                       ),
//                       Text('Login now to browse our hot offers',
//                           style: Theme.of(context)
//                               .textTheme
//                               .bodySmall!
//                               .copyWith(color: Colors.grey)),
//                       const SizedBox(
//                         height: 30.0,
//                       ),
//                       CustomField(
//                         controller: emailController,
//                         lable: "Email",
//                         icon: Iconsax.direct,
//                         showBorder: false,
//                       ),
//                       const SizedBox(
//                         height: 16.0,
//                       ),
//                       CustomField(
//                         showBorder: false,
//                         obscure: LoginCubit.get(context).isObsecure,
//                         controller: passWordController,
//                         lable: "Password",
//                         icon: Iconsax.lock,
//                         isPass: true,
//                         suffixIcon: LoginCubit.get(context).suffix,
//                         suffixPressed: () {
//                           LoginCubit.get(context).changePasswordVisibility();
//                         },
//                       ),
//                       const SizedBox(
//                         height: 16,
//                       ),
//                       // Row(
//                       //   children: [
//                       //     const Spacer(),
//                       //     GestureDetector(
//                       //       child: const Text("Forget Password?"),
//                       //       onTap: () {
//                       //       },
//                       //     )
//                       //   ],
//                       // ),
//
//                       // Text(
//                       //   'Hint: Use at least 8 characters, including uppercase letters, lowercase letters, numbers, and symbols.',
//                       //   style: TextStyle(
//                       //     color: Colors.grey,
//                       //     fontSize: 12,
//                       //   ),
//                       // ),
//                       const SizedBox(
//                         height: 30.0,
//                       ),
//                       state is LoginLoaded
//                           ? const Center(
//                               child: CircularProgressIndicator(),
//                             )
//                           : CustomButton(
//                               text: 'Login'.toUpperCase(),
//                               color: kPrimaryColor,
//                               textcolor: Colors.black,
//                               circular: 10.0,
//                               onTap: () {
//                                 if (formKey.currentState!.validate()) {
//                                   LoginCubit.get(context).userLogin(
//                                       email: emailController.text,
//                                       password: passWordController.text);
//                                 }
//                               },
//                             ),
//                       const SizedBox(
//                         height: 16,
//                       ),
//                       OutlinedButton(
//                         style: OutlinedButton.styleFrom(
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(12)),
//                           padding: const EdgeInsets.all(16),
//                         ),
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) {
//                                 return RegisterScreen();
//                               },
//                             ),
//                           );
//                         },
//                         child: Center(
//                           child: Text(
//                             "Create Account".toUpperCase(),
//                             style: TextStyle(
//                               color: Theme.of(context)
//                                   .colorScheme
//                                   .onBackground,
//                             ),
//                           ),
//                         ),
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


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:logaya/authorization.dart';
import 'package:logaya/view/auth/presentation/view/register.dart';
import 'package:logaya/view/auth/presentation/view/widgets/text_field.dart';

import '../../../../core/helper/cach.dart';
import '../../../../core/network/end_points.dart';
import '../../../../core/widget/colors.dart';
import '../../../../core/widget/custom_button.dart';
import '../../../../core/widget/custom_show_toast.dart';
import '../manager/login/login_cubit.dart';
import '../manager/login/login_state.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    var emailController = TextEditingController();
    var passWordController = TextEditingController();

    // Get AppBar color
    final appBarColor = Theme.of(context).appBarTheme.backgroundColor ?? Theme.of(context).primaryColor;

    return BlocProvider(
        create: (context) => LoginCubit(),
        child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccess) {
                if (state.loginModel.isAuthenticated == true) {
                  ChachHelper.saveData(
                      key: 'token', value: state.loginModel.token)
                      .then(
                        (value) {
                      userToken = '${state.loginModel.token}';
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => autho(),
                        ),
                            (route) => false,
                      );
                    },
                  );
                  showToast(
                      msg: 'Success', state: ToastStates.SUCCESS);
                } else {
                  showToast(
                      msg: 'Failed', state: ToastStates.ERROR);
                }
              }
            },
            builder: (context, state) {
              return Scaffold(
                appBar: AppBar(),
                body: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Login',
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          CustomField(
                            controller: emailController,
                            lable: "Email",
                            icon: Iconsax.direct,
                            showBorder: false,
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                          CustomField(
                            showBorder: false,
                            obscure: LoginCubit.get(context).isObsecure,
                            controller: passWordController,
                            lable: "Password",
                            icon: Iconsax.lock,
                            isPass: true,
                            suffixIcon: LoginCubit.get(context).suffix,
                            suffixPressed: () {
                              LoginCubit.get(context).changePasswordVisibility();
                            },
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          state is LoginLoaded
                              ? const Center(
                            child: CircularProgressIndicator(),
                          )
                              : CustomButton(
                            text: 'Login'.toUpperCase(),
                            color: appBarColor,
                            textcolor: Colors.white,
                            circular: 10.0,
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                LoginCubit.get(context).userLogin(
                                    email: emailController.text,
                                    password: passWordController.text);
                              }
                            },
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              padding: const EdgeInsets.all(16),
                              side: BorderSide(color: appBarColor),
                              backgroundColor: appBarColor,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return RegisterScreen();
                                  },
                                ),
                              );
                            },
                            child: Center(
                              child: Text(
                                "Create Account".toUpperCase(),
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            ),
        );
   }
}