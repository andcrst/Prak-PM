import 'package:flutter/material.dart';

import '../services/auth_service.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void _handleGoogleSignIn() async {
    final authService = AuthService();
    try {
      final user = await authService.signInWithGoogle();

      if (user != null) {
        // Login berhasil!
        print("Login Berhasil: ${user.email}");
      } else {
        // Login dibatalkan / gagal
        print("Login dibatalkan oleh user.");
      }
    } catch (e) {
      // Tampilkan error
      print("Error: ${e}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: const Color(0xffffffff),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/images/login-ornament-top.png'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Image.asset('assets/images/logo_secondary.png', width: 113),
                    const SizedBox(height: 16),
                    Text(
                      "Masuk atau Daftar",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 17),
                    Container(
                      width: 372,
                      height: 57,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Email",
                          contentPadding: EdgeInsets.only(
                            left: 17,
                            top: 17,
                            bottom: 17,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: 370,
                      height: 57,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        child: const Text(
                          "Selanjutnya",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 9),
                    SizedBox(
                      width: 372,
                      child: Row(
                        children: [
                          Container(width: 150, height: 2, color: Colors.black),
                          const SizedBox(width: 3),
                          const Text('OR'),
                          const SizedBox(width: 3),
                          Container(width: 150, height: 2, color: Colors.black),
                        ],
                      ),
                    ),
                    const SizedBox(height: 9),
                    Container(
                      width: 372,
                      height: 57,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: ElevatedButton(
                          onPressed: _handleGoogleSignIn,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffffffff),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/logo_google.png"),
                              SizedBox(width: 10),
                              Text("Lanjutkan dengan Google"),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Container(
                      width: 372,
                      height: 57,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/logos_facebook.png"),
                            SizedBox(width: 10),
                            Text("Lanjutkan dengan Facebook"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Image.asset('assets/images/login-ornament-bottom.png'),
            ],
          ),
        ),
      ),
    );
  }
}
