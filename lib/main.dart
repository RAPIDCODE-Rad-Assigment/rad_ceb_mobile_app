import 'package:flutter/material.dart';
import 'package:rad_ceb_mobile_app/homepage/homepage.dart';
import 'package:rad_ceb_mobile_app/login/Login.dart';
import 'package:rad_ceb_mobile_app/sign-up/SignUp.dart';
import 'package:rad_ceb_mobile_app/splash-screen/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const SplashScreen(),
    );
  }
}
