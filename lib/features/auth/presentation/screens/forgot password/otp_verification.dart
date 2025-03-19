// ignore_for_file: prefer_const_constructors

import 'package:bookia/core/colors/appcolour.dart';
import 'package:bookia/core/validation/validation.dart';
import 'package:bookia/core/widgets/back_button.dart';
import 'package:bookia/core/widgets/custom_button.dart';
import 'package:bookia/features/auth/presentation/widgets/register_login.dart';
import 'package:bookia/features/auth/presentation/widgets/welcome_text.dart';
import 'package:bookia/features/auth/presentation/screens/forgot%20password/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpVerification extends StatelessWidget {
  OtpVerification({super.key});
  final _formKey = GlobalKey<FormState>();
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
                    WelcomeText(text: 'OTP Verification'),
                    Text(
                      'Enter the verification code we just sent on your email address.',
                      style: TextStyle(
                        fontFamily: 'DM Serif Display',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColours.grayColor,
                      ),
                    ),
                    SizedBox(height: 30),
                    Pinput(
                      errorPinTheme: PinTheme(
                        width: 70,
                        height: 60,
                        textStyle: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.w700,
                          color: AppColours.darkColor,
                        ),
                        decoration: BoxDecoration(
                          color: AppColours.lightGrayColor,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: AppColours.redColor,
                            width: 1.2,
                          ),
                        ),
                      ),
                      focusedPinTheme: PinTheme(
                        width: 70,
                        height: 60,
                        textStyle: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.w700,
                          color: AppColours.darkColor,
                        ),
                        decoration: BoxDecoration(
                          color: AppColours.lightGrayColor,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: AppColours.primaryColor,
                            width: 1.2,
                          ),
                        ),
                      ),
                      validator: (value) => otpValid(value),
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      length: 4,
                      defaultPinTheme: PinTheme(
                        width: 70,
                        height: 60,
                        textStyle: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.w700,
                          color: AppColours.darkColor,
                        ),
                        decoration: BoxDecoration(
                          color: AppColours.lightGrayColor,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: AppColours.borderColor,
                            width: 1.2,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    CustomButton(
                      text: 'Verify',
                      onpressed: () async {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              duration: Duration(seconds: 1),
                              backgroundColor: AppColours.greenColor,
                              content: Text('Verifying Code'),
                            ),
                          );
                          await Future.delayed(Duration(seconds: 2));
                          if (!context.mounted) return;
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResetPassword(),
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
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: AppColours.greenColor,
                            duration: Duration(seconds: 1),
                            content: Text('Resending Code'),
                          ),
                        );
                      },
                      text: 'Didn\'t received code? ',
                      textButton: 'Resend',
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
