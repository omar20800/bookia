// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:bookia/core/colors/appcolour.dart';
import 'package:flutter/material.dart';

class BackButtonTile extends StatelessWidget {
  const BackButtonTile({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        height: 50,
        width: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColours.borderColor, width: 1),
        ),
        child: const Icon(Icons.arrow_back_ios, color: AppColours.darkColor),
      ),
    );
  }
}
