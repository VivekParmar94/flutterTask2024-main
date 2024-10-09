import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vivek_practical_demo/Contact/AddContact.dart';
import 'package:vivek_practical_demo/Contact/ContactDetail.dart';
import 'package:vivek_practical_demo/Models/Contacts/ContactResponse.dart';

import '../services/ApiClass.dart';
import '../utils/common_widgets.dart';

class ContactScreen extends StatefulWidget {
  final String token;

  const ContactScreen({super.key, required this.token});

  @override
  ContactScreenState createState() => ContactScreenState();
}

class ContactScreenState extends State<ContactScreen> {
  List<Data> dataItems = []; // List of Post objects
  List<Data> displayedItems = []; // List to hold currently displayed items
  bool isLoading = false;
  bool isLoadingMain = false;
  bool hasMoreData = true;
  int page = 1;
  final ScrollController _scrollController = ScrollController();
  int displayedCount = 15;

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

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        callContactApiFunction();
      }
    });
  }

  void getToken() async {
    callContactApiFunction();
  }

  Future<void> callContactApiFunction() async {
    callLoginApi(widget.token);
  }

  Future<void> callLoginApi(String token) async {
    print('calling api');
    setState(() {
      isLoading = true;
      isLoadingMain = true;
    });

    // Example API URL (replace with your own)
    final url = Uri.parse(APIClass.contactApi);

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
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        List<Data> fetchedItems = (jsonResponse['data'] as List)
            .map((itemJson) => Data.fromJson(itemJson))
            .toList();

        setState(() {
          dataItems = fetchedItems; // Store all fetched items
          displayedItems = dataItems.sublist(
              0, displayedCount); // Display the first 10 items
          isLoading = false;
          isLoadingMain = false;
        });
      } else {
        // Handle the error
        setState(() {
          isLoading = false;
          isLoadingMain = false;
        });
      }
    } else {
      setState(() {
        isLoading = false;
        isLoadingMain = false;
        hasMoreData = false; // Stop further requests in case of an error
      });
    }
  }

  void loadMoreItems() {
    if (displayedCount < dataItems.length) {
      setState(() {
        isLoading = true; // Start loading state
        isLoadingMain = false; // Start loading state
      });

      // Simulate a delay
      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          displayedCount += 10; // Load 10 more items
          displayedItems =
              dataItems.sublist(0, displayedCount); // Update displayed items
          isLoading = false; // End loading state
          isLoadingMain = false; // End loading state
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(
          'Contacts',
          style: TextStyle(
            // Custom text style
            color: Colors.black,
            fontSize: 16,
          ),
        )),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.purple,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddContact(
                  token: widget.token.toString(),
                ),
              ),
            );
          },
          child: const Icon(
            Icons.add,
            size: 25,
            color: Colors.white,
          ),
        ),
        body: Center(
          child: isLoadingMain
              ? CircularProgressIndicator()
              : NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification scrollInfo) {
                    if (!isLoading &&
                        scrollInfo.metrics.pixels ==
                            scrollInfo.metrics.maxScrollExtent) {
                      loadMoreItems(); // Load more items when reached the end of the list
                    }
                    return false; // Allow other listeners to receive the notification
                  },
                  child: ListView.builder(
                    itemCount: displayedItems.length +
                        (displayedCount < dataItems.length ? 1 : 0),
                    // Add one for loading indicator
                    itemBuilder: (context, index) {
                      if (index == displayedItems.length) {
                        // Show loading indicator at the end of the list
                        return const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }
                      return ListTile(
                          subtitle: GestureDetector(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 8),
                            CustomText(
                              text:
                                  "First Name: ${displayedItems[index].firstName}",
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
                            CustomText(
                              text: "Mobile : ${displayedItems[index].mobile}",
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
                            const SizedBox(height: 8),
                            const Divider(
                              color: Colors.blue, // Change color
                              thickness: 1, // Change thickness
                              height: 5, // Change height (spacing)
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ContactDetailScreen(
                                token: widget.token.toString(),
                                id: displayedItems[index].id.toString(),
                              ),
                            ),
                          );
                        },
                      ));
                    },
                  ),
                ),
        ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
