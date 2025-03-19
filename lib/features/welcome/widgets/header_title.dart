// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class HeaderTitle extends StatelessWidget {
  const HeaderTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/icons/book.png'),
              height: 70,
              width: 70,
            ),
            Text(
              'Bookia',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w400,
                color: Colors.black,
                fontFamily: 'DM Serif Display',
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Text(
          'Order Your Book Now!',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.black,
            fontFamily: 'DM Serif Display',
          ),
        ),
      ],
    );
  }
}
