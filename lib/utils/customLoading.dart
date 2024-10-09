import 'package:flutter/material.dart';

class CustomLoadingDialog {
  // Method to show the custom dialog
  static void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,  // Prevent closing the dialog by tapping outside
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,  // Makes the dialog background transparent
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(15),
            ),
              child: const Center(
                child:  Icon(
                  Icons.flutter_dash_outlined,
                  color: Colors.purple,
                  size: 100,
                ),
              )
          ),
        );
      },
    );
  }

  // Method to dismiss the custom dialog
  static void dismissLoadingDialog(BuildContext context) {
    Navigator.of(context).pop();
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Custom Loading Dialog")),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              CustomLoadingDialog.showLoadingDialog(context);

              // Simulate a delay for loading process
              await Future.delayed(Duration(seconds: 3));

              CustomLoadingDialog.dismissLoadingDialog(context);
            },
            child: Text("Show Loading Dialog"),
          ),
        ),
      ),
    );
  }
}
