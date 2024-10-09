import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vivek_practical_demo/BaseClassScreen.dart';
import 'package:vivek_practical_demo/Contact/ContactScreen.dart';
import 'package:vivek_practical_demo/Models/Contacts/AddContactResponse.dart';

import '../services/ApiClass.dart';
import '../utils/common_widgets.dart';
import '../utils/constant.dart';

class AddContact extends StatefulWidget {
  final String token;

  const AddContact({super.key, required this.token});

  @override
  AddContactState createState() => AddContactState();
}

class AddContactState extends State<AddContact> {
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  final _formKeyAddContact = GlobalKey<FormState>(); // Key for the form

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

  Future<void> _checkValidation() async {
    final firstname = firstNameController.text;
    final lastname = lastNameController.text;
    final email = emailController.text;
    final mobileNumber = mobileNumberController.text;

    if (firstname.isEmpty) {
      BaseScreen.getToastShow('Enter FirstName');
    } else if (lastname.isEmpty) {
      BaseScreen.getToastShow('Enter LastName');
    } else if (email.isEmpty) {
      BaseScreen.getToastShow('Enter Email');
    } else if (!checkEmailValidation(email)) {
      BaseScreen.getToastShow('Enter valid email address');
    } else if (mobileNumber.isEmpty) {
      BaseScreen.getToastShow('Enter MobileName');
    } else if (mobileNumber.length < 10) {
      BaseScreen.getToastShow('Enter valid MobileNumber');
    } else {
      String loginToken = widget.token;
      putchAddContactApi(mobileNumber, firstname, lastname, email, loginToken);
    }
  }

  Future<AddContactResponse> putchAddContactApi(
      String mobileNumber,
      String firstname,
      String lastName,
      String email,
      String loginToken) async {
    print('calling add contact api');
    final url = Uri.parse(APIClass.putchcontactApi);
    // Define the body
    final body = {
      'mobile': mobileNumber,
      'first_name': firstname,
      'last_name': lastName,
      'email': email,
      "contact_types": [
        {
          'id': 'a1dd708a-3db5-11ef-9634-484520bf7692',
        }
      ],
    };
    /*Map<String, dynamic> data = {
      "first_name": "demo user2",
      "last_name": "demo2",
      "email": "denouser2@gmail.com",
      "mobile": "2121212122",
      "contact_types": [
        {
          "id": "a1dd708a-3db5-11ef-9634-484520bf7692"
        }
      ]
    };*/
    // Make the POST request
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $loginToken',
        // Passing the token in the Authorization header
      },
      body: jsonEncode(body), // Convert map to JSON format
    );

    if (response.statusCode == 200) {
      print(response.body);
      gotoNextScreen();
      return AddContactResponse.fromJson(json.decode(response.body));
    }
    if (response.statusCode == 402) {
      print(response.body);
      return AddContactResponse.fromJson(json.decode(response.body));
    } else {
      // If the server did not return a 200 OK response, throw an exception
      throw Exception('Failed to call api');
    }
  }

  gotoNextScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ContactScreen(
          token: widget.token.toString(),
        ),
      ),
    );
  }

  //UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _formKeyAddContact,
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            "Add Contact",
            style: TextStyle(
              // Custom text style
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 25,
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              CustomContainer(
                width: double.infinity,
                height: 60,
                color: Colors.black,
                borderRadius: BorderRadius.circular(5.0),
                child: Center(
                  child: CustomTextFormField(
                    controller: firstNameController,
                    textStyle: const TextStyle(
                      // Custom text style
                      color: Colors.white,
                      fontSize: 18,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter FirstName',
                      fillColor: Colors.black87,
                      // Set the background color here
                      filled: true,
                      hintStyle: TextStyle(
                        color: Colors.white, // Change hint text color here
                      ),
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
                  child: CustomTextFormField(
                    controller: lastNameController,
                    textStyle: const TextStyle(
                      // Custom text style
                      color: Colors.white,
                      fontSize: 18,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter LastName',
                      fillColor: Colors.black87,
                      // Set the background color here
                      filled: true,
                      hintStyle: TextStyle(
                        color: Colors.white, // Change hint text color here
                      ),
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
                  child: CustomTextFormField(
                    controller: emailController,
                    textStyle: const TextStyle(
                      // Custom text style
                      color: Colors.white,
                      fontSize: 18,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Email',
                      fillColor: Colors.black87,
                      // Set the background color here
                      filled: true,
                      hintStyle: TextStyle(
                        color: Colors.white, // Change hint text color here
                      ),
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
                  child: CustomTextFormField(
                    controller: mobileNumberController,
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
                      hintStyle: TextStyle(
                        color: Colors.white, // Change hint text color here
                      ),
                    ),
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.white,
                    textInputAction: TextInputAction.next,
                    enabled: true,
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: CustomButton(
                  text: 'Add Contact',
                  onPressed: () {
                    _checkValidation();
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
    firstNameController.dispose();
    lastNameController.dispose();
    mobileNumberController.dispose();
    emailController.dispose();
    super.dispose();
  }

  bool checkEmailValidation(String value) {
    bool isValid;
    RegExp regex = RegExp(AppConstants.emailPattern);
    if (!regex.hasMatch(value)) {
      isValid = false;
      return isValid;
    } else {
      isValid = true;
      return isValid;
    }
  }
}
