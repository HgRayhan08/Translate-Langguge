import 'dart:async';

import 'package:apk_translate/screen/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void splahs() {
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    });
  }

  @override
  void initState() {
    splahs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 5),
              padding: const EdgeInsets.only(
                top: 45,
                bottom: 45,
                left: 10,
                right: 10,
              ),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff394867),
              ),
              child: const Text(
                "Translate",
                style: TextStyle(
                  fontSize: 25,
                  color: Color(0xffA4EBF3),
                ),
              ),
            ),
            const Text(
              "Language",
              style: TextStyle(fontSize: 25, color: Color(0xff394867)),
            ),
          ],
        ),
      ),
    );
  }
}
