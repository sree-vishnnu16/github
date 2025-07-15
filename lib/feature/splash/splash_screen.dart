import 'package:flutter/material.dart';
import 'dart:async';

import 'package:github/core/routes/routes.dart';
import 'package:github/feature/login/infrastructure/data/local/token_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final TokenStorage _tokenStorage = TokenStorage();

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    final token = await _tokenStorage.getToken();

    await Future.delayed(const Duration(seconds: 2)); // Simulate loading

    if (token != null && token.isNotEmpty) {
      Navigator.pushReplacementNamed(context, Routes.home); // User is logged in
    } else {
      Navigator.pushReplacementNamed(
          context, Routes.login); // User is not logged in
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('lib/assets/images/logo.png', width: 150),
            const SizedBox(height: 20),
            const Text(
              "Github",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
