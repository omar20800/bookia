import 'package:bookia/core/utils/text_style.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: getHeaderTextStyle()),
        centerTitle: true,
      ),
    );
  }
}
