import 'package:flutter/material.dart';
import 'package:vivek_practical_demo/Contact/ContactScreen.dart';
import 'package:vivek_practical_demo/Login/LoginScreen.dart';
import 'package:vivek_practical_demo/SplashScreen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // ignore: deprecated_member_use
      themeMode: ThemeMode.light,
      theme: ThemeData(
        brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
      ),

      home: SplashScreen(),
    );
  }
}
