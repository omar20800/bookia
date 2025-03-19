// ignore_for_file: prefer_const_constructors

import 'package:bookia/core/colors/appcolour.dart';
import 'package:bookia/core/widgets/back_button.dart';
import 'package:bookia/core/widgets/custom_button.dart';
import 'package:bookia/features/auth/presentation/widgets/input_field.dart';
import 'package:bookia/features/auth/presentation/widgets/welcome_text.dart';
import 'package:bookia/features/auth/presentation/screens/forgot%20password/password_changed.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatelessWidget {
  ResetPassword({super.key});
  final _formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
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
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PasswordChanged(),
                            ),
                          );
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
      ),
    );
  }
}
