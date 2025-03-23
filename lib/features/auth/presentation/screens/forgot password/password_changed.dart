// ignore_for_file: prefer_const_constructors

import 'package:bookia/core/utils/appcolour.dart';
import 'package:bookia/core/widgets/custom_button.dart';
import 'package:bookia/features/auth/presentation/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PasswordChanged extends StatelessWidget {
  const PasswordChanged({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  'assets/images/success.json',
                  height: 200,
                  width: 200,
                  repeat: false,
                ),
                SizedBox(height: 20),
                Text(
                  'Password Changed',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w400,
                    color: AppColours.darkColor,
                    fontFamily: 'DM Serif Display',
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Your password has been changed successfully.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: AppColours.grayColor,
                    fontFamily: 'DM Serif Display',
                  ),
                ),
                SizedBox(height: 20),
                CustomButton(
                  text: 'Back to Login',
                  onpressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  bcolor: AppColours.primaryColor,
                  tcolor: AppColours.backgroundColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
