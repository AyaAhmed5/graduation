
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:logaya/view/auth/presentation/view/widgets/text_field.dart';

import '../../../../authorization.dart';
import '../../../../core/helper/cach.dart';
import '../../../../core/network/end_points.dart';
import '../../../../core/widget/colors.dart';
import '../../../../core/widget/custom_button.dart';
import '../../../../core/widget/custom_show_toast.dart';
import '../manager/register/register_cubit.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  var emailController = TextEditingController();
  var passWordController = TextEditingController();
  var usernameController = TextEditingController();
  var firstnameController = TextEditingController();
  var lastnameController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            if (state.registerModel.isAuthenticated == true) {
              ChachHelper.saveData(
                      key: 'token', value: state.registerModel.token)
                  .then((value) {
                userToken = '${state.registerModel.token}';
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => autho(),
                  ),
                  (route) => false,
                );
              });
              print('The Token is ${state.registerModel.token}');
              showToast(msg: 'Success', state: ToastStates.SUCCESS);
            } else {
              showToast(msg: 'Failed', state: ToastStates.ERROR);
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
                        'Register',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      Text('Register now to browse our hot offers',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: Colors.grey)),
                      const SizedBox(
                        height: 30.0,
                      ),
                      CustomField(
                        controller: firstnameController,
                        lable: "First Name",
                        onSubmitted: (value) {
                          emailController.text = value;
                        },
                        icon: Iconsax.user,
                        showBorder: false,
                      ),
                       CustomField(
                        controller: lastnameController,
                        lable: "Last Name",
                        onSubmitted: (value) {
                          emailController.text = value;
                        },
                        icon: Iconsax.user,
                        showBorder: false,
                      ),
                       CustomField(
                        controller: usernameController,
                        lable: "user Name",
                        onSubmitted: (value) {
                          emailController.text = value;
                        },
                        icon: Iconsax.user,
                        showBorder: false,
                      ),
                      CustomField(
                        controller: emailController,
                        lable: "Email",
                        icon: Iconsax.direct,
                        showBorder: false,
                      ),
                      CustomField(
                        showBorder: false,
                        obscure: RegisterCubit.get(context).isObsecure,
                        controller: passWordController,
                        lable: "Password",

                        icon: Iconsax.lock,
                        isPass: true,
                        onSubmitted: (value) {
                          passWordController.text = value;
                        },
                        suffixIcon: RegisterCubit.get(context).suffix,
                        suffixPressed: () {
                          RegisterCubit.get(context).changePasswordVisibility();
                        },
                      ),
                      Text(
                        'Hint: Use at least 8 characters, including uppercase letters, lowercase letters, numbers, and symbols.',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                      CustomField(
                        controller: confirmPasswordController,

                        onSubmitted: (value) {
                          passWordController.text = value;
                        },
                        lable: "Confirm Password",
                        icon: Icons.lock,
                        showBorder: false,
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      state is RegisterLoaded
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : CustomButton(
                              text: 'Register'.toUpperCase(),
                              color: kPrimaryColor,
                              textcolor: Colors.black,
                              circular: 10.0,
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  RegisterCubit.get(context).userRegister(
                                      firstName: firstnameController.text,
                                      lastName: lastnameController.text,
                                      userNameame: usernameController.text,
                                      confirmPassword:
                                          confirmPasswordController.text,
                                      email: emailController.text,
                                      password: passWordController.text);
                                }
                              },
                            ),
                      const SizedBox(
                        height: 15.0,
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
