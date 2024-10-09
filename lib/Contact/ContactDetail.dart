import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vivek_practical_demo/Contact/ContactScreen.dart';
import 'package:vivek_practical_demo/Models/Contacts/ContactResponse.dart';
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
  List<Data> dataItems = []; // List of Post objects
  bool isLoading = false;

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
    print('calling api');

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
      ContactResponse apiResponse = ContactResponse.fromJson(jsonResponse);
      dataItems = apiResponse.data!;

      setState(() {
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
      appBar: AppBar(
        title: const Text(
          "Contact Detail",
          style: TextStyle(
            // Custom text style
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ContactScreen(
                  token: widget.token.toString(),
                ),
              ),
            );
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 25,
          ),
        ),
      ),
      body: dataItems.isEmpty
          ? const Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(child: CircularProgressIndicator()),
            )
          : ListTile(
              subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [for (var i in dataItems) _buidbody(i)]),
            ),
    );
  }

  Widget _buidbody(i) {
    return Column(
      children: [
        const SizedBox(height: 8),
        CustomText(
          text: "First Name: ${i.firstName.toString()}",
          style: const TextStyle(
            // Custom text style
            color: Colors.blue,
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        const SizedBox(height: 8),
        CustomText(
          text: "Last Name: ${i.lastName.toString()}",
          style: const TextStyle(
            // Custom text style
            color: Colors.blue,
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        const SizedBox(height: 8),
        CustomText(
          text: "Email: ${i.email.toString()}",
          style: const TextStyle(
            // Custom text style
            color: Colors.blue,
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        const SizedBox(height: 8),
        CustomText(
          text: "Mobile : ${i.mobile.toString()}",
          style: const TextStyle(
            // Custom text style
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
