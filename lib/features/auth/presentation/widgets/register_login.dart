import 'package:bookia/core/colors/appcolour.dart';
import 'package:flutter/material.dart';

class RegisterLogin extends StatelessWidget {
  const RegisterLogin({
    super.key,
    required this.text,
    required this.textButton,
    required this.onPressed,
  });
  final String text;
  final String textButton;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(
            fontFamily: 'DM Serif Display',
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: AppColours.darkColor,
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(padding: EdgeInsets.only(left: 5)),
          onPressed: () {
            onPressed();
          },
          child: Text(
            textButton,
            style: TextStyle(
              color: AppColours.primaryColor,
              fontSize: 15,
              fontWeight: FontWeight.w400,
              fontFamily: 'DM Serif Display',
            ),
          ),
        ),
      ],
    );
  }
}
