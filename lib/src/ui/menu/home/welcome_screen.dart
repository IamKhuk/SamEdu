import 'dart:async';

import 'package:flutter/material.dart';
import 'package:samedu/src/theme/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    _nextScreen();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to\nSamEdu',
              style: TextStyle(
                fontFamily: AppTheme.fontFamily,
                fontSize: 36,
                fontWeight: FontWeight.bold,
                height: 1.5,
                color: AppTheme.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ClipRRect(
                child: Image.asset(
                  'assets/images/welcome.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _nextScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isWelcome', false);

    Timer(
      const Duration(milliseconds: 2270),
          () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const MainScreen();
            },
          ),
        );
      },
    );
  }
}
