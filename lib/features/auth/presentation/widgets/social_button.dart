// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({super.key, required this.icon});
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {},
        child: Container(
          height: 56,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xffE8ECF4), width: 1),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Image(image: AssetImage(icon)),
        ),
      ),
    );
  }
}
