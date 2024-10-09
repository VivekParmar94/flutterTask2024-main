// ignore_for_file: unnecessary_new
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vivek_practical_demo/Contact/ContactScreen.dart';
import 'package:vivek_practical_demo/Login/LoginScreen.dart';

void main(List<String> args) {
  const MaterialApp(
    debugShowCheckedModeBanner: false,
  );
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var duration;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var isFirstloginToken;

  @override
  void initState() {
    super.initState();
    if (context.mounted) {
      loginRetrieveValues();
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> loginRetrieveValues() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      isFirstloginToken = prefs.getString("userToken") ?? "";
    });
    goWelcomePage();
  }

  void goWelcomePage() async {
    await Future.delayed(const Duration(seconds: 3));
    welcomePage();
  }

  void welcomePage() {
    if (isFirstloginToken.isEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) {
          return LoginScreen();
        }),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) {
          return ContactScreen(
            token: isFirstloginToken,
          );
        }),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return const Stack(
      children: [
        Center(
          child: Icon(
            Icons.flutter_dash_outlined,
            color: Colors.purple,
            size: 200,
          ),
        )
      ],
    );
  }
}
