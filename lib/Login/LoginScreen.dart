import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vivek_practical_demo/BaseClassScreen.dart';
import 'package:vivek_practical_demo/Contact/ContactScreen.dart';

import '../Models/Login/LoginResponse.dart';
import '../services/ApiClass.dart';
import '../utils/common_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  TextEditingController mobileNumberControler =
      TextEditingController(text: '9876543210');
  TextEditingController passwordController =
      TextEditingController(text: 'admin');
  final _formKey = GlobalKey<FormState>(); // Key for the form
  bool _obscureText = true;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    super.initState();
    print('Connected initState!');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('Connected didChangeDependencies!');
  }

  Future<void> _validationAndLogin() async {
    final mobileNumber = mobileNumberControler.text = '9876543210';
    final password = passwordController.text = 'admin123';
    if (mobileNumber.isEmpty) {
      BaseScreen.getToastShow('Enter Mobile Number');
    } else if (password.isEmpty) {
      BaseScreen.getToastShow('Enter Password');
    } else {
      LoginResponse loginResponse = await callLoginApi(mobileNumber, password);

      if (loginResponse.status == true) {
        print(loginResponse.message);
        BaseScreen.getToastShow(loginResponse.message.toString());
        final SharedPreferences prefs = await _prefs;
        prefs.setString(
          'userToken',
          loginResponse.token.toString(),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ContactScreen(
              token: loginResponse.token.toString(),
            ),
          ),
        );
      } else {
        BaseScreen.getToastShow(loginResponse.message.toString());
      }
    }
  }

  Future<LoginResponse> callLoginApi(
      String mobileNumber, String password) async {
    final url = Uri.parse(APIClass.loginApi);
    // Define the body
    final body = {
      'mobile': mobileNumber,
      'password': password,
    };
    // Make the POST request
    final response = await http.post(
      url,
      body: body,
    );
    if (response.statusCode == 200) {
      print(response.body);
      return LoginResponse.fromJson(json.decode(response.body));
    }
    if (response.statusCode == 402) {
      print(response.body);
      return LoginResponse.fromJson(json.decode(response.body));
    } else {
      // If the server did not return a 200 OK response, throw an exception
      throw Exception('Failed to call api');
    }
  }

  //UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _formKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 200),

              CustomText(
                text: 'Login',
                style: const TextStyle(
                  // Custom text style
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              SizedBox(height: 50),
              CustomContainer(
                width: double.infinity,
                height: 60,
                color: Colors.black,
                borderRadius: BorderRadius.circular(5.0),
                child: Center(
                  child: CustomTextFormField(
                    controller: mobileNumberControler,
                    textStyle: const TextStyle(
                      // Custom text style
                      color: Colors.white,
                      fontSize: 18,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Mobile Number',
                      fillColor: Colors.black87,
                      // Set the background color here
                      filled: true,
                    ),
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.white,
                    textInputAction: TextInputAction.next,
                    enabled: true,
                  ),
                ),
              ),
              SizedBox(height: 20),

              CustomContainer(
                width: double.infinity,
                height: 60,
                color: Colors.black,
                borderRadius: BorderRadius.circular(5.0),
                child: Center(
                  child: Row(
                    children: [
                      Flexible(
                        child: CustomTextFormField(
                          obscureText: _obscureText,
                          // Control password visibility
                          controller: passwordController,
                          textStyle: const TextStyle(
                            // Custom text style
                            color: Colors.white,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter Password',
                            fillColor: Colors.black87,
                            // Set the background color here
                            filled: true,
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureText =
                                      !_obscureText; // Toggle password visibility
                                });
                              },
                            ),
                          ),
                          keyboardType: TextInputType.text,
                          cursorColor: Colors.white,
                          enabled: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: CustomButton(
                  text: 'Login',
                  onPressed: () {
                    _validationAndLogin();
                  },
                  elevation: 5.0,
                  // Button elevation
                  textStyle: TextStyle(
                    // Custom text style
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.3),
                        offset: Offset(2, 2),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    // Custom box decoration
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(30.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        offset: Offset(4, 4),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 200),
              // Simulate more content to enable scrolling
            ],
          ),
        ));
  }

  @override
  void dispose() {
    mobileNumberControler.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
