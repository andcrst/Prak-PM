// import 'dart:nativewrappers/_internal/vm/lib/async_patch.dart';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myapp_first/screens/auth/auth_wrapper.dart';
import 'package:myapp_first/screens/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _navigateToNextScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => AuthWrapper()),
    );
  }

  @override
  void initState() {
    super.initState();

    Timer(Duration(milliseconds: 2500), _navigateToNextScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/images/top-linear.png'),
          Image.asset('assets/images/logo.png', width: 174),
          Image.asset('assets/images/bottom-linear.png'),
        ],
      ),
    );
  }
}
