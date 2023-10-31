import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'NetworkCheckScreen.dart';
import 'home/homepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToScreen();
  }

  Future<void> _navigateToScreen() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    await Future.delayed(const Duration(seconds: 2));
    if (connectivityResult == ConnectivityResult.none) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => NetworkCheckScreen(),
        ),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Color brightWhite = Colors.white.withRed(255).withGreen(255).withBlue(255);

    return Container(
      color: brightWhite,
      child: Center(
        child: Image.asset(
          'images/splash.jpg',
          width: 300,
          height: 350,
        ),
      ),
    );
  }
}
