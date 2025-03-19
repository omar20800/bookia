// ignore_for_file: prefer_const_constructors

import 'package:bookia/core/colors/appcolour.dart';
import 'package:bookia/core/widgets/back_button.dart';
import 'package:bookia/core/widgets/custom_button.dart';
import 'package:bookia/features/auth/presentation/widgets/input_field.dart';
import 'package:bookia/features/auth/presentation/screens/forgot%20password/otp_verification.dart';
import 'package:bookia/features/auth/presentation/screens/login/login_screen.dart';
import 'package:bookia/features/auth/presentation/widgets/register_login.dart';
import 'package:bookia/features/auth/presentation/widgets/welcome_text.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

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
                    WelcomeText(text: 'Forgot Password?'),
                    Text(
                      'Don\'t worry! It occurs. Please enter the email address linked with your account.',
                      style: TextStyle(
                        fontFamily: 'DM Serif Display',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColours.grayColor,
                      ),
                    ),
                    SizedBox(height: 30),
                    InputField(
                      controller: emailController,
                      ispassword: false,
                      keyboardType: TextInputType.emailAddress,
                      hint: 'Enter your email',
                    ),
                    SizedBox(height: 30),
                    CustomButton(
                      text: 'Send Code',
                      onpressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: AppColours.greenColor,
                              content: Text('Sending Code'),
                            ),
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OtpVerification(),
                            ),
                          );
                        }
                      },
                      bcolor: AppColours.primaryColor,
                      tcolor: AppColours.backgroundColor,
                    ),
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
                      text: 'Remember Password?',
                      textButton: 'Login',
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
