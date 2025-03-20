// ignore_for_file: prefer_const_constructors

import 'package:bookia/core/colors/appcolour.dart';
import 'package:bookia/core/widgets/back_button.dart';
import 'package:bookia/core/widgets/custom_button.dart';
import 'package:bookia/core/widgets/dialogs.dart';
import 'package:bookia/features/auth/data/model/request/auth_request.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_states.dart';
import 'package:bookia/features/auth/presentation/widgets/input_field.dart';
import 'package:bookia/features/auth/presentation/screens/login/login_screen.dart';
import 'package:bookia/features/auth/presentation/widgets/login_with.dart';
import 'package:bookia/features/auth/presentation/widgets/register_login.dart';
import 'package:bookia/features/auth/presentation/widgets/welcome_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        body: BlocConsumer<AuthCubit, AuthStates>(
          listener: (context, state) {
            if (state is AuthError) {
              Navigator.pop(context);
              showErrorToast(context, state.message);
            } else if (state is AuthSuccess) {
              Navigator.pop(context);
              showSuccessToast(context, 'Register Successful');
            } else if (state is AuthLoading) {
              showLoadingDialog(context);
            }
          },
          builder: (context, state) {
            var cubit = context.read<AuthCubit>();
            return Form(
              key: _formKey,
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 55,
                        left: 24,
                        right: 24,
                        bottom: 24,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BackButtonTile(),
                          SizedBox(height: 20),
                          WelcomeText(text: 'Hello! Register to get started'),
                          SizedBox(height: 30),
                          InputField(
                            controller: nameController,
                            ispassword: false,
                            keyboardType: TextInputType.name,
                            hint: 'Username',
                          ),
                          SizedBox(height: 20),
                          InputField(
                            controller: emailController,
                            ispassword: false,
                            keyboardType: TextInputType.emailAddress,
                            hint: 'Email',
                          ),
                          SizedBox(height: 20),
                          InputField(
                            controller: passwordController,
                            ispassword: true,
                            hint: 'Password',
                          ),
                          SizedBox(height: 20),
                          InputField(
                            controller: confirmPasswordController,
                            ispassword: true,
                            hint: 'Confirm Password',
                          ),
                          SizedBox(height: 20),
                          CustomButton(
                            text: 'Register',
                            onpressed: () {
                              if (_formKey.currentState!.validate()) {
                                if (passwordController.text !=
                                    confirmPasswordController.text) {
                                  showErrorToast(
                                    context,
                                    'Passwords do not match',
                                  );
                                } else {
                                  cubit.register(
                                    AuthRequest(
                                      name: nameController.text,
                                      email: emailController.text,
                                      password: passwordController.text,
                                    ),
                                  );
                                }
                              }
                            },
                            bcolor: AppColours.primaryColor,
                            tcolor: AppColours.backgroundColor,
                          ),
                          SizedBox(height: 20),
                          LoginWith(text: 'Or Register with'),
                          Expanded(child: SizedBox()),
                          RegisterLogin(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ),
                              );
                            },
                            text: 'Already have an account?',
                            textButton: 'Login Now',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
