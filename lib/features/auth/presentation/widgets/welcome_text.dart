// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key, required this.text, this.width});
  final String text;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 280,
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'DM Serif Display',
          fontSize: 30,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
