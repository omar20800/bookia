import 'package:bookia/core/model/user_model.dart';
import 'package:bookia/core/service/dio_provider.dart';
import 'package:bookia/core/service/local_helper.dart';
import 'package:bookia/features/home/presentation/screens/home_screen.dart';
import 'package:bookia/features/main/presentation/screens/main_screen.dart';
import 'package:bookia/features/welcome/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  await Hive.openBox<UserModel>("userBox");
  await AppLocalStorage.init();
  await DioProvider.init();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
          AppLocalStorage.getCachedUser('user') != null
              ? MainScreen()
              : WelcomeScreen(),
    );
  }
}
