import 'package:absolute_stay/splashscreen.dart';
import 'package:flutter/material.dart';

void main()  {
  runApp(const MyApp());
}
//manikandan
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Absolute Stay',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: const SplashScreen(),
    );
  }
}

////////////  Hacker