// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:bookia/core/constants/constants.dart';
import 'package:bookia/core/utils/appcolour.dart';
import 'package:bookia/core/widgets/custom_button.dart';
import 'package:bookia/core/widgets/no_connection_widget.dart';
import 'package:bookia/features/auth/presentation/screens/login/login_screen.dart';
import 'package:bookia/features/auth/presentation/screens/register/register_screen.dart';
import 'package:bookia/features/welcome/widgets/header_title.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    bool? isconnected;
    checkInternetConnection().then((value) {
      isconnected = value;
    });
    if (isconnected == true) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          top: false,
          child: Container(
            padding: const EdgeInsets.all(22),
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('assets/images/welcome.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HeaderTitle(),
                SizedBox(height: 300),
                CustomButton(
                  text: 'Login',
                  onpressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginScreen();
                        },
                      ),
                    );
                  },
                  bcolor: AppColours.primaryColor,
                  tcolor: AppColours.backgroundColor,
                ),
                SizedBox(height: 20),
                CustomButton(
                  text: 'Register',
                  onpressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                    );
                  },
                  bcolor: AppColours.backgroundColor,
                  tcolor: AppColours.darkColor,
                  sidecolor: AppColours.borderColor,
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return NoConnectionWidget();
    }
  }
}
