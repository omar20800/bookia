// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bookia/core/utils/appcolour.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onpressed,
    required this.bcolor,
    required this.tcolor,
    this.sidecolor,
    this.height,
    this.width,
    this.fontsize,
  });
  final String text;
  final Function onpressed;
  final Color bcolor;
  final Color tcolor;
  final Color? sidecolor;
  final double? height;
  final double? width;
  final double? fontsize;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 56,
      width: width ?? double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color:
                  sidecolor == null ? AppColours.transparentColor : sidecolor!,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor: bcolor,
        ),
        onPressed: () {
          onpressed();
        },
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontsize ?? 15,
            fontWeight: FontWeight.w400,
            color: tcolor,
            fontFamily: 'DM Serif Display',
          ),
        ),
      ),
    );
  }
}
