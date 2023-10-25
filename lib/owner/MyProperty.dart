import 'package:flutter/material.dart';
import 'ownerCustomSwitch.dart'; // Import your custom switch widget.

class MyPropertyApp extends StatefulWidget {
  @override
  State<MyPropertyApp> createState() => _MyPropertyAppState();
}

class _MyPropertyAppState extends State<MyPropertyApp> {
  Color customColor = const Color.fromRGBO(33, 84, 115, 1.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Property'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Text(
                  'My Property',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: customColor,
                  ),
                ),
                const SizedBox(height: 30,),
                const OwnerCustomSwitch(), // This is your custom switch widget.
              ],
            ),
          ),
        ),
      ),
    );
  }
}
