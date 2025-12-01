import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myapp_first/screens/login.dart';
import 'package:myapp_first/screens/navbar.dart';

class AuthWrapper extends StatelessWidget {
  AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(child: CircularProgressIndicator())
            );
        }
        if (snapshot.hasData) {
          return Navbar();
        }

        return LoginScreen();
      },
    );
  }
}
