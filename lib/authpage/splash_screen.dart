import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:async';
import '../authpage/auth.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to HomePage after 3 seconds
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AuthPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF001F54), // Warna biru dari logo
      body: Center(
        child: Image.asset(
          'assets/images/logo.png', // Ganti sesuai path logo Anda
          width: 200.0, // Ukuran gambar
          height: 200.0,
        ),
      ),
    );
  }
}
