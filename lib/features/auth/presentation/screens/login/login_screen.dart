// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:bookia/core/utils/appcolour.dart';
import 'package:bookia/core/widgets/back_button.dart';
import 'package:bookia/core/widgets/custom_button.dart';
import 'package:bookia/core/widgets/dialogs.dart';
import 'package:bookia/features/auth/data/model/request/auth_request.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_states.dart';
import 'package:bookia/features/auth/presentation/screens/forgot%20password/forgot_password.dart';
import 'package:bookia/core/widgets/input_field.dart';
import 'package:bookia/features/auth/presentation/widgets/login_with.dart';
import 'package:bookia/features/auth/presentation/widgets/register_login.dart';
import 'package:bookia/features/auth/presentation/screens/register/register_screen.dart';
import 'package:bookia/features/auth/presentation/widgets/welcome_text.dart';
import 'package:bookia/features/main/presentation/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Form(
        key: _formKey,
        child: SafeArea(
          top: false,
          child: Scaffold(
            body: BlocConsumer<AuthCubit, AuthStates>(
              listener: (context, state) {
                if (state is AuthError) {
                  Navigator.pop(context);
                  showErrorToast(context, state.message);
                } else if (state is AuthSuccess) {
                  Navigator.pop(context);
                  showSuccessToast(context, 'Login Successful');
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => MainScreen()),
                    (route) => false,
                  );
                } else if (state is AuthLoading) {
                  showLoadingDialog(context);
                }
              },
              builder: (context, state) {
                var cubit = context.read<AuthCubit>();
                return CustomScrollView(
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
                            WelcomeText(
                              text: 'Welcome back! Glad to see you, Again!',
                            ),
                            SizedBox(height: 30),
                            InputField(
                              controller: emailController,
                              ispassword: false,
                              keyboardType: TextInputType.emailAddress,
                              hint: 'Enter your email',
                            ),
                            SizedBox(height: 20),
                            InputField(
                              controller: passwordController,
                              ispassword: true,
                              keyboardType: TextInputType.visiblePassword,
                              hint: 'Enter your password',
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ForgotPassword(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'Forgot Password?',
                                    style: TextStyle(
                                      fontFamily: 'DM Serif Display',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: AppColours.grayColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            CustomButton(
                              text: 'Login',
                              onpressed: () {
                                if (_formKey.currentState!.validate()) {
                                  cubit.login(
                                    AuthRequest(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    ),
                                  );
                                }
                              },
                              bcolor: AppColours.primaryColor,
                              tcolor: AppColours.backgroundColor,
                            ),
                            SizedBox(height: 20),
                            LoginWith(text: 'Or Login with'),
                            Expanded(child: SizedBox()),
                            RegisterLogin(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RegisterScreen(),
                                  ),
                                );
                              },
                              text: 'Don\'t have an account?',
                              textButton: 'Register Now',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
