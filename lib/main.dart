import 'package:bookia/core/service/dio_provider.dart';
import 'package:bookia/features/welcome/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  await DioProvider.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}
