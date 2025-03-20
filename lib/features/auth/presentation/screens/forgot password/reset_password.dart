// ignore_for_file: prefer_const_constructors

import 'package:bookia/core/colors/appcolour.dart';
import 'package:bookia/core/widgets/back_button.dart';
import 'package:bookia/core/widgets/custom_button.dart';
import 'package:bookia/core/widgets/dialogs.dart';
import 'package:bookia/features/auth/data/model/request/auth_request.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_states.dart';
import 'package:bookia/features/auth/presentation/widgets/input_field.dart';
import 'package:bookia/features/auth/presentation/widgets/welcome_text.dart';
import 'package:bookia/features/auth/presentation/screens/forgot%20password/password_changed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPassword extends StatelessWidget {
  ResetPassword({super.key, required this.otp});
  final int otp;
  final _formKey = GlobalKey<FormState>();
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
            } else if (state is AuthLoading) {
              showLoadingDialog(context);
            } else if (state is AuthSuccess) {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PasswordChanged()),
              );
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
                          WelcomeText(
                            width: double.infinity,
                            text: 'Create new password',
                          ),
                          Text(
                            'Your new password must be unique from those previously used.',
                            style: TextStyle(
                              fontFamily: 'DM Serif Display',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColours.grayColor,
                            ),
                          ),
                          SizedBox(height: 30),
                          InputField(
                            controller: passwordController,
                            ispassword: true,
                            keyboardType: TextInputType.visiblePassword,
                            hint: 'New Password',
                          ),
                          SizedBox(height: 20),
                          InputField(
                            controller: confirmPasswordController,
                            ispassword: true,
                            keyboardType: TextInputType.visiblePassword,
                            hint: 'Confirm Password',
                          ),
                          SizedBox(height: 30),
                          CustomButton(
                            text: 'Reset Password',
                            onpressed: () async {
                              if (_formKey.currentState!.validate()) {
                                if (passwordController.text !=
                                    confirmPasswordController.text) {
                                  showErrorToast(
                                    context,
                                    'Passwords do not match',
                                  );
                                } else {
                                  cubit.resetPassword(
                                    AuthRequest(
                                      verifyCode: otp,
                                      password: passwordController.text,
                                    ),
                                  );
                                }
                              }
                            },
                            bcolor: AppColours.primaryColor,
                            tcolor: AppColours.backgroundColor,
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
