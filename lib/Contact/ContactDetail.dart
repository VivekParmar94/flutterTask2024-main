import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Models/Contacts/ContactsDetailsResponse.dart';
import '../services/ApiClass.dart';
import '../utils/common_widgets.dart';

class ContactDetailScreen extends StatefulWidget {
  final String token;
  final String id;

  const ContactDetailScreen({super.key, required this.token, required this.id});

  @override
  ContactDetailScreenState createState() => ContactDetailScreenState();
}

class ContactDetailScreenState extends State<ContactDetailScreen> {
  final _formKeyAddContact = GlobalKey<FormState>(); // Key for the form

  Data dataItems = new Data(); // List of Post objects
  bool isLoading = false;
  late String firstName;
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    print('Connected initState!');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('Connected didChangeDependencies!');
    getToken();
  }

  void getToken() async {
    callContactApiFunction();
  }

  Future<void> callContactApiFunction() async {
    callContactDetailApi(widget.token, widget.id);
  }

  Future<void> callContactDetailApi(String token, String id) async {
    print('Contact calling api');
    setState(() {
      isLoading = true;
    });

    final url = Uri.parse(APIClass.idcontactApi + id);
    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
        // Passing the token in the Authorization header
      },
    );

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      ContactsDetailsResponse apiResponse =
          ContactsDetailsResponse.fromJson(jsonResponse);
      setState(() {
        dataItems = apiResponse.data!;
        firstNameController.text = dataItems.firstName.toString();
        lastNameController.text = dataItems.lastName.toString();
        emailController.text = dataItems.email.toString();
        mobileNumberController.text = dataItems.mobile.toString();
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formKeyAddContact,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Contact Details",
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
      body: Center(
          child: isLoading
              ? CircularProgressIndicator() // Show progress bar while loading
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 50),
                      CustomContainer(
                        width: double.infinity,
                        height: 60,
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5.0),
                        child: Center(
                          child: CustomText(
                            text: firstNameController.text,
                            style: const TextStyle(
                              // Custom text style
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      CustomContainer(
                        width: double.infinity,
                        height: 60,
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5.0),
                        child: Center(
                          child: CustomText(
                            text: lastNameController.text,
                            style: const TextStyle(
                              // Custom text style
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      CustomContainer(
                        width: double.infinity,
                        height: 60,
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5.0),
                        child: Center(
                          child: CustomText(
                            text: emailController.text,
                            style: const TextStyle(
                              // Custom text style
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      CustomContainer(
                        width: double.infinity,
                        height: 60,
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5.0),
                        child: Center(
                          child: CustomText(
                            text: mobileNumberController.text,
                            style: const TextStyle(
                              // Custom text style
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      /*SizedBox(
                width: double.infinity,
                height: 60,
                child: CustomButton(
                  text: 'Update Contact',
                  onPressed: () {
                    // _checkValidation();
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
              ),*/
                      SizedBox(height: 200),
                      // Simulate more content to enable scrolling
                    ],
                  ),
                ) // Show error message if data is null
          ),
    );
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    mobileNumberController.dispose();
    emailController.dispose();
    super.dispose();
  }
}
